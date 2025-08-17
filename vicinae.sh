#!/bin/sh

SERVICE_NAME="vicinae"

service_param() {
    local param="$1"
    systemctl --user show -p "${param}" --value "${SERVICE_NAME}"
}

if [[ "${RUNNING_AS_SERVICE}" != "1" && "$1" = "serve" ]]; then
    systemctl --user daemon-reload

    LOAD_STATE=$(service_param "LoadState")
    if [[ "$LOAD_STATE" != "loaded" ]]; then
        mkdir -p "${HOME}/.config/systemd/user"
        ln -s "/usr/lib/systemd/system/${SERVICE_NAME}.service" "${HOME}/.config/systemd/user/${SERVICE_NAME}.service"
        systemctl --user daemon-reload
        systemctl --user enable "${SERVICE_NAME}"
    fi

    ACTIVE_STATE=$(service_param "ActiveState")
    if [[ "${ACTIVE_STATE}" = "active" ]]; then
        systemctl --user restart "${SERVICE_NAME}"
        echo "INFO: Restarting vicinae server"
    elif [[ "${ACTIVE_STATE}" = "inactive" ]]; then
        systemctl --user start "${SERVICE_NAME}"
        echo "INFO: Starting vicinae server"
    else
        echo "ERR: Please check the server logs using: journalctl -u ${SERVCE_NAME}"
        exit 1
    fi

    exit 0
fi

/opt/PKGNAME/bin/vicinae "$@"
