#!/bin/bash

echo "Setting up Part 3 challenge environment..."
echo ""

SCRIPTS_DIR="$HOME/scripts"

mkdir -p "$SCRIPTS_DIR"

# Create hello.sh
cat > "$SCRIPTS_DIR/hello.sh" << 'EOF'
#!/bin/bash
echo "Hello from a script!"
EOF

# Create backup.sh
cat > "$SCRIPTS_DIR/backup.sh" << 'EOF'
#!/bin/bash
echo "Backup script running..."
EOF

# Create secret.sh
cat > "$SCRIPTS_DIR/secret.sh" << 'EOF'
#!/bin/bash
echo "This is a secret script"
EOF

# Set incorrect permissions initially
chmod 644 "$SCRIPTS_DIR/hello.sh"
chmod 644 "$SCRIPTS_DIR/backup.sh"
chmod 644 "$SCRIPTS_DIR/secret.sh"

echo "Created scripts in ~/scripts/"
echo "  - hello.sh (needs to be executable for user only)"
echo "  - backup.sh (needs to be readable and executable by everyone)"
echo "  - secret.sh (needs to be readable and writable by user only)"
echo ""
echo "Your task: Set the correct permissions and create sysinfo.sh"
echo "Read README.md for full instructions."