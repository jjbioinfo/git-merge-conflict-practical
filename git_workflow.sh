#!/usr/bin/env bash

# Copy and run these commands one block at a time in the project folder.
# Do not run the complete file at once because the conflict must be resolved manually.

# Store the repository name and paths used by later commands.
REPOSITORY_NAME="git-merge-conflict-practical"
PROJECT_DIR=$(pwd)
CONFLICT_SEED="$PROJECT_DIR/.conflict_seed"

# Confirm that Git and GitHub CLI are installed and GitHub CLI is authenticated.
command -v git
command -v gh
gh auth status

# Initialize the repository with main as the first branch.
git init -b main

# Confirm that the Git author name and email have already been configured.
git config user.name
git config user.email

# Stage and commit the original project files to create the common base commit.
git add \
    .gitignore \
    README.md \
    VIDEO_SCRIPT.md \
    app_config.py \
    git_workflow.sh \
    main.py \
    portal.py \
    test_portal.py
git commit -m "Add initial Study Portal project"

# Run the tests and application before creating the feature branches.
python test_portal.py
python main.py

# Save the common base commit so both branches start from exactly the same point.
BASE_COMMIT=$(git rev-parse HEAD)

# Create the public GitHub repository, connect it as origin, and push main.
gh repo create "$REPOSITORY_NAME" --public --source=. --remote=origin
git push -u origin main

# Create the first branch from the base and apply its welcome-message change.
git switch -c feature-friendly-message "$BASE_COMMIT"
cp "$CONFLICT_SEED/feature-friendly-message/app_config.py" app_config.py
git diff
git add app_config.py
git commit -m "Add friendly welcome message"
git push -u origin feature-friendly-message

# Return to main and create the second branch from the same base commit.
git switch main
git switch -c feature-motivational-message "$BASE_COMMIT"
cp "$CONFLICT_SEED/feature-motivational-message/app_config.py" app_config.py
git diff
git add app_config.py
git commit -m "Add motivational welcome message"
git push -u origin feature-motivational-message

# Merge the first branch into main; this merge should complete successfully.
git switch main
git merge --no-ff feature-friendly-message -m "Merge friendly welcome message"

# Attempt to merge the second branch; Git should report a conflict in app_config.py.
git merge --no-ff feature-motivational-message

# Display the conflicted file and Git status, including the conflict markers.
git status
sed -n '1,80p' app_config.py

# MANUAL STEP:
# Open app_config.py in an editor.
# Remove <<<<<<< HEAD, =======, and >>>>>>> feature-motivational-message.
# Replace the two competing messages with this one line:
# WELCOME_MESSAGE = "Welcome back—keep learning and keep growing"
# Save app_config.py before continuing with the commands below.

# Check for remaining conflict markers and review the manual resolution.
# The grep command should display nothing when every marker has been removed.
! grep -nE '^(<<<<<<<|=======|>>>>>>>)' app_config.py
git diff

# Run the tests and application using the manually resolved file.
python test_portal.py
python main.py

# Stage the resolved file and commit the completed conflict resolution.
git add app_config.py
git status
git commit -m "Resolve welcome message merge conflict"

# Push the final resolved main branch to GitHub.
git push origin main

# Display the final branch graph and confirm that the working tree is clean.
git log --oneline --graph --all --decorate
git status

# Display the public repository URL for submission.
gh repo view --json url --jq .url
