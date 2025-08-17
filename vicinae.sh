#!/bin/sh

SERVICE_NAME="vicinae"
if [[ "$RUNNING_AS_SERVICE" != "1" ]]; then
    LOAD_STATE=$(systemctl --user show -p LoadState --value "$SERVICE_NAME")
    if [[ "$LOAD_STATE" != "loaded" ]]; then
        # ensure user directory exists
        mkdir -p ~/.config/systemd/user

        # link system service to user directory
        ln -s "/usr/lib/systemd/system/${SERVICE_NAME}.service" "$HOME/.config/systemd/user/${SERVICE_NAME}.service"
        
        # reload the daemon
        systemctl --user daemon-reload
        systemctl --user enable "$SERVICE_NAME"
    fi

    ACTIVE_STATE=$(systemctl --user show -p ActiveState --value "$SERVICE_NAME")
    if [[ "$ACTIVE_STATE" != "active" ]]; then
        systemctl --user start "$SERVICE_NAME"
        sleep 1
    fi
fi

/opt/PKGNAME/bin/vicinae "$@"
