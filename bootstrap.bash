#!/bin/bash

#
# * bootstrap.bash - quick script to bootstrap the xbps-src build environment
#


# == Config

# Official Void Linux package repository and the desired directory name
repo="https://github.com/void-linux/void-packages/"
repodir="official"

# Files and/or directories to copy over from repository above
copy=("common/" "etc/" "srcpkgs/xbps-triggers" "xbps-src")

# Directories to create in our repository
create=("srcpkgs")


# == Functions

# Cleanup helper function, mainly to delete cloned repository
function cleanup() {
  echo -e "\n[i] Cleaning up '$repodir'"

  if (rm --force --recursive "./$repodir"); then
    echo "[i] Deleted cloned repository."
  else
    echo "[?] Couldn't delete it for some reason? See any previous output from 'rm'!"
    echo "[?] This isn't critical, continuing..."
  fi
}


# == Script

echo 
echo "[i] === Started $0 on $(date '+%Y-%m-%d %H:%M:%S') ==="
echo "[i]" 
echo "[i] Current configuration:"
echo "[i] - Using upstream repository '$repo' and cloning to '$repodir'"
echo "[i] - Directories to create: ${create[*]}"
echo "[i] - Paths to copy from '$repodir': ${copy[*]}"
echo "[i]"
echo "[i] Bootstrapping a new xbps-src environment in '$PWD'"
echo 

# Set cleanup helper function to run on exit
trap cleanup EXIT

# Create all previously set directories, skip path if it already exists
echo "[i] Creating initial directory structure"
for path in "${create[@]}"; do
  echo "[i] Creating '$path'"

  if [[ ! -d "$path" ]]; then
    mkdir -p "$path" && echo "[i] Done."
  fi
done

# Clone official repository (with '--depth 1' for a quicker clone) to $repodir
echo -e "\n[i] Cloning '$repo'"
if (git clone "$repo" --depth 1 "$repodir"); then
  echo "[i] Done, cloned to '$repodir'."
else
  echo "[!] Could not clone repository, can't continue!" &>/dev/stderr
  echo "[!] Double-check permissions or your internet connection, and then try again." &>/dev/stderr
  exit 1
fi

# Copy required files and directories from the cloned repository
echo -e "\n[i] Gathering required files from '$repodir'"
for path in "${copy[@]}"; do
  # Check if it already exists, skip if true
  if [[ ( -e "$path" ) || ( -d "$path" ) ]]; then
    echo "[?] Path/file '$path' already exists, skipping!"
    continue
  fi

  # Check if copy operation is successful
  echo "[i] Copying '$path'"
  if (cp --recursive "./$repodir/$path" "$PWD"); then
    echo "[i] Done."
  else
    echo "[!] Failed to copy file(s), review your permissions!" &>/dev/stderr
    exit 1
  fi
done

# Prompt if the user wants to continue immediately,
# if not, remind the user of the command and quit
echo -e "\n[i] Do you want to bootstrap the final build environment immediately?"
while :; do
  read -r -p "[Y/n]> " choice
  case "${choice,,}" in

    "n")
      echo "[i] Quitting..."
      echo "[i] Run './xbps-src binary-bootstrap' manually!"
      exit
      ;;

    ""|"y")
      echo "[i] Continuing..."
      break
      ;;

    *)
      echo "[?] Did not receive 'Y' or 'N', try again?"
      ;;

  esac
done

# Run bootstrap script with 'xbps-src'
echo -e "\n[i] Bootstrapping final build environment"
echo "[$] ./xbps-src binary-bootstrap"
if (./xbps-src binary-bootstrap); then
  echo "[i] Done."
  echo ""
  echo "[i] You can now begin building packages!"
else
  echo "[!] Received non-zero exit code from 'xbps-src'!" &>/dev/stderr
  echo "[!] Go through previous output and manually run the bootstrap command." &>/dev/stderr
  exit 1
fi
