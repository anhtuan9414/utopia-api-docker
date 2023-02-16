#!/bin/bash
{
if [ ! -f /app/account.db ]; then
    echo "creating new account.."
    export XDG_RUNTIME_DIR=/tmp/runtime-root
    cd /opt/utopia/messenger
    ./utopia --headless --create --db=/app/account.db --pwd=password --configPath=/app/utopia.cfg
    cd /app
fi
}
