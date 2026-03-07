#!/usr/bin/env bash

set -e
set -u

if [ "$(id -u)" -ne 0 ]; then
    echo; printf "\033[1;33mRun the script as root.\033[0m\n" >&2; echo
    exit 1
fi

USER=$SUDO_USER


if ! command -v firefox &> /dev/null; then
    echo "Firefox is not installed."
    exit 1
fi

if pgrep "firefox" > /dev/null; then
    echo; printf "\033[1;33mFirefox is working. Please close it manually.\033[0m\n" >&2; echo
    exit 0
fi

# https://hg-edge.mozilla.org/integration/autoland/rev/8a6d6c094cb5#l9.114
xdg_check () {

    FIREFOX_VERSION=$(firefox --version | grep -oP '\d+\.\d+\.\d+' | cut -d '.' -f 1)

    if [ "$FIREFOX_VERSION" -ge 147 ]; then
        FIREFOX_CONFIG_DIR="/home/${USER}/.config/mozilla"
    else
        FIREFOX_CONFIG_DIR="/home/${USER}/.mozilla"
    fi

}



setup () {

    FIREFOX_PATH=/usr/lib/firefox

    cp distribution/policies.json "${FIREFOX_PATH}/distribution/"
    cp defaults/pref/autoconfig.js "${FIREFOX_PATH}/defaults/pref/"
    cp firefox.cfg "${FIREFOX_PATH}/"

    if [ -d "${FIREFOX_CONFIG_DIR}/" ]; then
      rm -rf "${FIREFOX_CONFIG_DIR}/"
    fi

    sudo -u ${USER} firefox &
    PID=$!
    sleep 6
    kill $PID 2>/dev/null || true

    # profile parsing
    CURRENT_PROFILE_PATH=$(awk -F= '/Locked=1/ {print prev} {prev=$2}' ${FIREFOX_CONFIG_DIR}/firefox/profiles.ini | xargs)

    sudo -u ${USER} cp user.js "${FIREFOX_CONFIG_DIR}/firefox/${CURRENT_PROFILE_PATH}/"

}


# Entry point
echo
read -p "Proceed install? (y/N): " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo
    xdg_check
    setup
else
    echo "Canceled..."
    echo
    exit 0
fi
