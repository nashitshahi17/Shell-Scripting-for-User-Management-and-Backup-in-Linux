#!/bin/bash

# ========================
# COLORS
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

# ========================

# ========================
# LOG FUNCTION
log() {
    echo "$(date +'%F %T') : $1" >> logs/backup.log
}

# ========================

# ========================
# CHECK ROOT PERMISSIONS
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}Error: Run as root!${RESET}"
    log "Failed: Script not run as root."
    exit 1
fi

# ========================

# ========================
# VALIDATE DIRECTORY
validate_directory() {
    if [[ ! -d "$1" ]]; then
        echo -e "${RED}Error: Directory '$1' does not exist!${RESET}"
        log "Failed: '$1' directory does not exist."
        exit 1
    fi
}

# ========================

# ========================
# BACKUP FUNCTION
take_backup() {
    read -p "Enter directory to back up: " SRC_DIR

    validate_directory "$SRC_DIR"

    BACKUP_DIR="backups"
    mkdir -p "$BACKUP_DIR"

    TIMESTAMP=$(date +%F-%H-%M-%S)
    BACKUP_FILE="$BACKUP_DIR/backup-$TIMESTAMP.tar.gz"

    echo -e "${YELLOW}Creating backup...${RESET}"

    if tar -czf "$BACKUP_FILE" "$SRC_DIR" 2>/dev/null; then
        echo -e "${GREEN}Backup created: $BACKUP_FILE${RESET}"
        log "Backup successful: $SRC_DIR -> $BACKUP_FILE"
    else
        echo -e "${RED}Backup failed!${RESET}"
        log "Backup FAILED for directory: $SRC_DIR"
        exit 1
    fi
}

# ========================

# ========================
# MENU / INPUT HANDLING
echo -e "${BLUE}===== BACKUP SYSTEM =====${RESET}"
take_backup

# ========================


