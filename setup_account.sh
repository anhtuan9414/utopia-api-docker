#!/bin/bash
cd /opt/utopia/messenger
echo "password">p.txt
./utopia --headless --create --db=/app/account.db --configPath=/app/utopia.cfg < p.txt
cd /app
