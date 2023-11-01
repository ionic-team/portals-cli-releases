set -eo pipefail

BLUE='\033[1;94m'
GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if curl is installed
if ! hash curl 2> /dev/null; then
  printf "${RED}error: you do not have 'curl' installed which is required for this script.${NC}\n"
  exit 1
fi

# If the install directory is not set, set it to a default
if [ -z ${PORTALS_INSTALL_DIR+x} ]; then
  PORTALS_INSTALL_DIR=/usr/local/bin
fi

# If the install path is not set, set it to a default
PORTALS_INSTALL_PATH="${PORTALS_INSTALL_DIR}/portals"

# Check if the ionic-cloud cli is already installed
if [ -f "$PORTALS_INSTALL_PATH" ]; then
  printf "${RED}error: Portals CLI is already installed at \'${PORTALS_INSTALL_PATH}\'${NC}\n"
  exit 1
fi

# If the desired version is not set, get the latest version from the API
if [ -z ${PORTALS_VERSION+x} ]; then
  PORTALS_VERSION=latest
  PORTALS_DOWNLOAD_URL_PREFIX="https://github.com/ionic-team/portals-cli-releases/releases/latest/download/"
else
  PORTALS_DOWNLOAD_URL_PREFIX="https://github.com/ionic-team/portals-cli-releases/releases/download/${PORTALS_VERSION}/"
fi

# Set some constant values
PORTALS_BINARY_Darwin_arm64="portals_Darwin_arm64.tar.gz"
PORTALS_BINARY_Darwin_x86_64="portals_Darwin_x86_64.tar.gz"
PORTALS_BINARY_Linux_arm64="portals_Linux_arm64.tar.gz"
PORTALS_BINARY_Linux_i386="portals_Linux_i386.tar.gz"
PORTALS_BINARY_Linux_x86_64="portals_Linux_x86_64.tar.gz"
PORTALS_BINARY_Windows_i386="portals_Windows_i386.zip"
PORTALS_BINARY_Windows_x86_64="portals_Windows_x86_64.zip"

# Lookup the platform and architecture
PLATFORM=`uname -s`
ARCH=`uname -m`

# Normalize the Windows platforms
if [[ $PLATFORM == CYGWIN* ]] || [[ $PLATFORM == MINGW* ]] || [[ $PLATFORM == MSYS* ]]; then
  PLATFORM="Windows"
  printf "${RED}error: Windows is not currently supported through the automated installer. Please download the appropriate binary manually from https://github.com/ionic-team/portals-cli-releases/releases.${NC}\n"
  exit 1
fi

BINARY_LOOKUP="PORTALS_BINARY_${PLATFORM}_${ARCH}"
DOWNLOAD_URL="${PORTALS_DOWNLOAD_URL_PREFIX}${!BINARY_LOOKUP:-}"

# If the binary lookup wasn't successful the download url will be equal to the prefix
if [ $DOWNLOAD_URL == $PORTALS_DOWNLOAD_URL_PREFIX ]; then
  printf "${RED}error: your platform and architecture (${PLATFORM}-${ARCH}) is unsupported.${NC}\n"
  exit 1
fi


printf "Installing Portals CLI ${PORTALS_VERSION}\n"

echo "Attempting to download from $DOWNLOAD_URL"

if ! curl -sfL "$DOWNLOAD_URL" | tar -xz -C $PORTALS_INSTALL_DIR ; then
  printf "${RED}error: Portals CLI version ${PORTALS_VERSION} was not found or $PORTALS_INSTALL_DIR does not exist.${NC}\n"
  exit 1
fi

printf "Installation path: \'${PORTALS_INSTALL_DIR}/portals\'\n"
printf "  Make sure this is on your PATH.\n"

printf "${GREEN}Installation successful. Try 'portals --help' to get started.${NC}\n"
