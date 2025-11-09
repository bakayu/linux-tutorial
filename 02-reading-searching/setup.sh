#!/bin/bash

echo "Setting up Part 2 challenge environment..."
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATA_DIR="$SCRIPT_DIR/sample-data"

mkdir -p "$DATA_DIR"

cat > "$DATA_DIR/server.log" << 'EOF'
192.168.1.1 - - [15/Jan/2024:10:15:23] "GET /home HTTP/1.1" 200 1234
192.168.1.2 - - [15/Jan/2024:10:15:45] "GET /api/users HTTP/1.1" 404 567
192.168.1.1 - - [15/Jan/2024:10:16:12] "POST /login HTTP/1.1" 200 890
192.168.1.3 - - [15/Jan/2024:10:16:34] "GET /home HTTP/1.1" 200 1234
192.168.1.2 - - [15/Jan/2024:10:17:01] "GET /api/posts HTTP/1.1" 500 234
192.168.1.4 - - [15/Jan/2024:10:17:23] "GET /about HTTP/1.1" 200 678
192.168.1.1 - - [15/Jan/2024:10:18:45] "GET /api/users HTTP/1.1" 404 567
192.168.1.1 - - [15/Jan/2024:10:19:12] "GET /contact HTTP/1.1" 200 456
EOF

echo "Created sample-data/server.log with 8 log entries"
echo ""
echo "Challenge ready!"
echo "Read README.md for instructions."