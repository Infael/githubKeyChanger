
# GitHub Token Updater

A simple shell script to update the GitHub personal access token in a local Git repository. This script ensures that sensitive tokens are correctly set in the remote URL while removing any previously stored credentials.

## Features

- Automatically removes any existing token from the remote URL.
- Updates the remote URL with the new token provided by the user.
- Ensures the upstream branch is correctly set for the `master` branch.
- Works safely with both `https` and personal access tokens.

## Prerequisites

- **Git** must be installed on your system.
- You need a valid **GitHub Personal Access Token**. Learn how to generate one [here](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token).

## Installation

1. Clone this repository or download the script:
   ```bash
   git clone https://github.com/your-repo/github-token-updater.git
   cd github-token-updater
   ```

2. Make the script executable:
   ```bash
   chmod +x githubKeyChanger.sh
   ```

3. (Optional) Add the script to your PATH for easy access:
   ```bash
   export PATH="/path/to/this/repository:$PATH"
   ```

## Usage

Run the script by passing your GitHub Personal Access Token as an argument:

```bash
./githubKeyChanger.sh <your-personal-access-token>
```

### Example:

```bash
./githubKeyChanger.sh ghp_12345EXAMPLETOKEN
```

## Secure Usage

To avoid exposing your token in command history, use the following method to input your token securely:

```bash
read -s -p "Enter your GitHub personal token: " token
./githubKeyChanger.sh $token
```

## How It Works

1. The script checks if the current directory is a valid Git repository.
2. It removes any existing remote origin URL containing credentials.
3. It updates the remote origin URL with the new token.
4. If the current branch is `master`, it sets the upstream to `origin/master` after fetching remote branches.

## Important Notes

- This script does **not** store your token permanently. It only updates the remote URL for the current repository.
- Ensure you handle your token securely. Avoid sharing it or adding it to public repositories.
- If your repository uses the `main` branch instead of `master`, update the script to reflect this or create a pull request to add support for detecting default branches.

## License

This project is licensed under the [MIT License](LICENSE).
