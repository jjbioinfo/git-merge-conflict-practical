# Create and Resolve a Real Merge Conflict

This project deliberately creates a Git merge conflict by changing the same
`WELCOME_MESSAGE` line in `app_config.py` on two branches created from the same
base commit.

## Conflict scenario

The base `main` branch contains:

```python
WELCOME_MESSAGE = "Welcome to the Study Portal"
```

`feature-friendly-message` changes it to:

```python
WELCOME_MESSAGE = "Welcome back and get ready to learn"
```

`feature-motivational-message` changes the same line to:

```python
WELCOME_MESSAGE = "Keep learning—you are doing great"
```

Both branches start from the same base. After the friendly branch is merged into
`main`, Git cannot automatically decide whether the friendly or motivational text
should remain when the second branch is merged.

## Conflict markers

During the second merge, `app_config.py` will temporarily contain markers similar
to these:

```text
<<<<<<< HEAD
WELCOME_MESSAGE = "Welcome back and get ready to learn"
=======
WELCOME_MESSAGE = "Keep learning—you are doing great"
>>>>>>> feature-motivational-message
```

- `<<<<<<< HEAD` begins the version currently in `main`.
- `=======` separates the competing changes.
- `>>>>>>> feature-motivational-message` ends the incoming branch version.

## Resolution decision

The final resolution preserves the friendly welcome and the motivational intent:

```python
WELCOME_MESSAGE = "Welcome back—keep learning and keep growing"
```

The conflict markers are removed, the resolved file is staged with `git add`, and
the merge resolution is recorded with `git commit`.

## Project structure

```text
9_merge_conflict_resolution/
├── .gitignore
├── README.md
├── VIDEO_SCRIPT.md
├── app_config.py
├── git_workflow.sh
├── main.py
├── portal.py
└── test_portal.py
```

The ignored `.conflict_seed/` directory contains the two prepared branch
versions. The final conflict resolution must be typed manually during the
workflow.

## Run the initial project

```bash
python main.py
python test_portal.py
```

## Run the conflict workflow

Open `git_workflow.sh` and copy its commands into the terminal one block at a
time while recording. Do not run the complete script at once because the merge
conflict must be inspected and resolved manually.

```bash
cd /Users/JJOHN41/Documents/my_learning/euron_super30/assignment/week6/9_merge_conflict_resolution
```

GitHub CLI must be installed and authenticated. The commands create a public
repository named `git-merge-conflict-practical`. When the second merge reports
a conflict, edit `app_config.py`, remove the conflict markers, and save the
chosen final message before copying the remaining commands.

## Submission links

- Public GitHub repository: `GENERATED-AFTER-RUNNING-THE-SCRIPT`
- YouTube video: `ADD-YOUTUBE-VIDEO-URL`
