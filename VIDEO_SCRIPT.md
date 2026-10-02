# Video Explanation Guide

1. Show the base `WELCOME_MESSAGE` line and initial passing tests.
2. Create both branches from the same base `main` commit.
3. On `feature-friendly-message`, change the welcome-message line and commit it.
4. On `feature-motivational-message`, change the same line differently and commit.
5. Merge the friendly branch into `main` successfully.
6. Attempt to merge the motivational branch and show Git reporting a conflict.
7. Run `git status` and display `app_config.py` with `<<<<<<<`, `=======`, and
   `>>>>>>>` markers.
8. Explain which branch produced each side of the conflict.
9. Manually replace both alternatives and all markers with the combined final
   message, save the file, and then continue copying the remaining commands.
10. Stage the resolved file and commit the merge resolution.
11. Run the final tests and application.
12. Show `git log --oneline --graph --all --decorate` and the public repository.

Important point: a merge conflict is not a program failure. Git pauses because a
human decision is required about which competing content should be retained.
