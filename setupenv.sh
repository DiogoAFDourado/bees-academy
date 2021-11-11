#!/bin/bash

if [[ "$EUID" -eq 0 ]]
  then echo "Do not run this script as root (with sudo). Provide the password just when asked."
  exit
fi

PYTHON_VERSION="3.9"
if [[ "$OSTYPE" ==  "linux-gnu" ]]; then
  PKG_MANAGER="apt-get"
  QUERY_PKG_CMD="apt-cache show"
  PKG_LIST=("python$PYTHON_VERSION" "python$PYTHON_VERSION-venv" "python$PYTHON_VERSION-dev")
  UPDATE_REPOS_CMD="sudo $PKG_MANAGER update"
elif [[ "$OSTYPE" ==  *"darwin"* ]]; then
  PKG_MANAGER="brew"
  QUERY_PKG_CMD="brew info"
  PKG_LIST=("python@$PYTHON_VERSION")
  UPDATE_REPOS_CMD="$PKG_MANAGER update"
  if [[ "$SHELL" == "/bin/bash" ]]; then
    INIT_FILE="$HOME/.bash_profile"
  elif [[ "$SHELL" == "/bin/zsh" ]]; then
    INIT_FILE="$HOME/.zprofile"
  else
    echo "Shell not supported."
    exit 1
  fi
else
  echo "Operating system not supported."
  exit 1
fi

echo "Updating repositories..."
$UPDATE_REPOS_CMD

for pkg in "${PKG_LIST[@]}"; do
  echo "Checking $pkg installation..."
  $QUERY_PKG_CMD "$pkg" &> /dev/null
  status=$?
  if [[ $status -ne 0 ]]; then
      echo "Installing $pkg..."
      if [[ "$OSTYPE" ==  "linux-gnu" ]]; then
        sudo $PKG_MANAGER install "$pkg"
      else
        $PKG_MANAGER install "$pkg"
        echo "export PATH=\"/usr/local/opt/python@$PYTHON_VERSION/bin:\$PATH\"" >> "$INIT_FILE"
        # Disabling this check because shellcheck cannot follow a non-constant source and the source may differ
        # depending on the environment.
        # shellcheck disable=SC1090
        source "$INIT_FILE"
      fi
  else
    echo "Package $pkg already installed."
  fi
done

VENV_PATH="venv"
if [[ -d "$VENV_PATH" ]]; then
  echo "A venv already exists at $VENV_PATH. Removing it..."
  rm -r "$VENV_PATH"
fi

echo "Creating virtualenv at $VENV_PATH..."
"python$PYTHON_VERSION" -m venv "$VENV_PATH"
echo "Activating venv..."
source "$VENV_PATH"/bin/activate
echo "Updating venv site packages..."
pip install pip setuptools -U
./install.sh
