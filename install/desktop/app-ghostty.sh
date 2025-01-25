# Check if this is meant to be for Alacritty or Ghostty
# If for Ghostty:
source /etc/os-release
ARCH=$(dpkg --print-architecture)

# Add error handling for the GitHub API request
GHOSTTY_DEB_URL=$(curl -s https://api.github.com/repos/mkasberg/ghostty-ubuntu/releases/latest | \
   grep -oP "https://github.com/mkasberg/ghostty-ubuntu/releases/download/[^\s/]+/ghostty_[^\s/_]+_${ARCH}_${VERSION_ID}.deb" || echo "")

if [ -z "$GHOSTTY_DEB_URL" ]; then
    echo "Error: Could not find a matching Ghostty release for ${ARCH} architecture and Ubuntu ${VERSION_ID}"
    exit 1
fi

GHOSTTY_DEB_FILE=$(basename "$GHOSTTY_DEB_URL")

# Add error handling for download
if ! curl -LO "$GHOSTTY_DEB_URL"; then
    echo "Error: Failed to download Ghostty"
    exit 1
fi

# Add error handling for installation
if ! sudo dpkg -i "$GHOSTTY_DEB_FILE"; then
    echo "Error: Failed to install Ghostty"
    rm "$GHOSTTY_DEB_FILE"
    exit 1
fi

rm "$GHOSTTY_DEB_FILE"
