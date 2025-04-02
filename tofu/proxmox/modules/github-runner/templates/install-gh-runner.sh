#!/bin/bash
set -ex

# Set the owner and repository
OWNERREPO=joelmccoy/homelabv2

# Create a dedicated user for the runner
RUNNER_USER="github-runner"
RUNNER_HOME="/home/$RUNNER_USER"

# Install dependencies as root
apt update -y && apt install -y git curl zip sudo

# Create the runner user if it doesn't exist
if ! id -u $RUNNER_USER > /dev/null 2>&1; then
  useradd -m -s /bin/bash $RUNNER_USER
  echo "$RUNNER_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$RUNNER_USER
  chmod 0440 /etc/sudoers.d/$RUNNER_USER
fi

# Install Docker
curl -qfsSL https://get.docker.com | sh
# Add the runner user to the docker group AFTER the user is created
usermod -aG docker $RUNNER_USER

# Switch to the runner user for the rest of the setup
mkdir -p $RUNNER_HOME/actions-runner
cd $RUNNER_HOME/actions-runner

# Download the latest runner package
curl -o actions-runner-linux-x64-2.323.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz

# Optional: Validate the hash
echo "0dbc9bf5a58620fc52cb6cc0448abcca964a8d74b5f39773b7afcad9ab691e19  actions-runner-linux-x64-2.323.0.tar.gz" | shasum -a 256 -c

# Extract the installer
tar xzf ./actions-runner-linux-x64-2.323.0.tar.gz

# The token is passed in via a file to avoid exposing it in command output
if [ -f "/tmp/github_token" ]; then
  GITHUB_TOKEN=$(cat /tmp/github_token)
  rm -f /tmp/github_token  # Remove the token file after reading

  # Get the runner token
  RES=$(curl -q -L \
    -X POST \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $GITHUB_TOKEN"  \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/$OWNERREPO/actions/runners/registration-token)

  RUNNER_TOKEN=$(echo $RES | grep -o '"token": "[^"]*' | grep -o '[^"]*$')
else
  echo "ERROR: GitHub token not found!"
  exit 1
fi

# Set proper ownership
chown -R $RUNNER_USER:$RUNNER_USER $RUNNER_HOME/actions-runner

# Configure and start the runner as the dedicated user
cd $RUNNER_HOME/actions-runner
sudo -u $RUNNER_USER ./config.sh --unattended --url https://github.com/$OWNERREPO --token $RUNNER_TOKEN

# Install and start the service
cd $RUNNER_HOME/actions-runner
./svc.sh install $RUNNER_USER
./svc.sh start
