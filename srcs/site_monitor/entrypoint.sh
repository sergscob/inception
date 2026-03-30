#!/bin/sh
set -e

echo "🚀 Starting site monitor container..."

# virtual environment activation
source /venv/bin/activate

# send startup notification
python /app/monitor.py --startup

# run the monitor
python /app/monitor.py