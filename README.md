# Make It Green

This repository is designed to automatically generate daily commits to keep the repository active and contribute to a "green" commit history.

The `daily-commit.yml` workflow performs the following steps:

1.  **Checks out** the `action-commit` branch.
2.  **Configures** Git user name and email.
3.  **Creates** an empty commit with the message "Daily commit".
4.  **Pushes** the commit to the `action-commit` branch on the `origin` remote.

## License

This project is licensed under the [GPL-v3](LICENSE).
