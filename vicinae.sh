#!/bin/sh

service_param() {
    local param="$1"
    systemctl --user show -p "${param}" --value vicinae
}

if [[ "$RUNNING_AS_SERVICE" != "1" && "$1" = "server" ]]; then
    systemctl --user daemon-reload

    LOAD_STATE=$(service_param "LoadState")
    if [[ "$LOAD_STATE" != "loaded" ]]; then
        mkdir -p "$HOME/.config/systemd/user"
        ln -s "/usr/lib/systemd/system/vicinae.service" "$HOME/.config/systemd/user/vicinae.service"
        systemctl --user daemon-reload
        systemctl --user enable "vicinae"
    fi

    ACTIVE_STATE=$(service_param "ActiveState")
    if [[ "${ACTIVE_STATE}" = "active" ]]; then
        systemctl --user restart vicinae
        echo "INFO: Restarting vicinae server"
    elif [[ "${ACTIVE_STATE}" = "inactive" ]]; then
        systemctl --user start vicinae
        echo "INFO: Starting vicinae server"
    else
        systemctl --user restart vicinae
        echo "ERR: Please check the server logs using: journalctl --user -u vicinae"
        exit 1
    fi

    exit 0
fi

/opt/PKGNAME/bin/vicinae "$@"
