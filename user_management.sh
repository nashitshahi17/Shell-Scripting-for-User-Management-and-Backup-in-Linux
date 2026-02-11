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
# LOGGING FUNCTION
log() {
    echo "$(date +'%F %T') : $1" >> logs/script.log
}
# ========================

# ========================
# CHECK ROOT PERMISSIONS
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}Error: Run this script as root!${RESET}"
    exit 1
fi

# ========================

# ========================
# FUNCTION: CREATE GROUP
create_group() {
    read -p "Enter group name: " GROUP

    if getent group "$GROUP" >/dev/null; then
        echo -e "${YELLOW}Group '$GROUP' already exists.${RESET}"
        log "Group '$GROUP' already exists."
    else
        groupadd "$GROUP"
        echo -e "${GREEN}Group '$GROUP' created.${RESET}"
        log "Group '$GROUP' created successfully."
    fi
}

# ========================

# ========================
# FUNCTION: CREATE USER
create_user() {
    read -p "Enter username: " USER

    if id "$USER" >/dev/null 2>&1; then
        echo -e "${YELLOW}User '$USER' already exists.${RESET}"
        log "User '$USER' already exists."
        return
    fi

    read -p "Enter default shell (/bin/bash): " SHELL
    SHELL=${SHELL:-/bin/bash}

    useradd -m -s "$SHELL" "$USER"
    passwd "$USER"

    echo -e "${GREEN}User '$USER' created.${RESET}"
    log "User '$USER' created successfully."
}

# ========================

# ========================
# FUNCTION: ADD USER TO GROUP
add_user_to_group() {
    read -p "Enter username: " USER
    read -p "Enter group name: " GROUP

    if ! id "$USER" >/dev/null 2>&1; then
        echo -e "${RED}User '$USER' does not exist.${RESET}"
        log "Failed: User '$USER' does not exist."
        return
    fi

    if ! getent group "$GROUP" >/dev/null; then
        echo -e "${RED}Group '$GROUP' does not exist.${RESET}"
        log "Failed: Group '$GROUP' does not exist."
        return
    fi

    usermod -aG "$GROUP" "$USER"
    echo -e "${GREEN}User '$USER' added to '$GROUP'.${RESET}"
    log "User '$USER' added to group '$GROUP'."
}

# ========================

# ========================
# MENU
while true; do
    echo -e "${BLUE}"
    echo "===== USER MANAGEMENT MENU ====="
    echo "1. Create Group"
    echo "2. Create User"
    echo "3. Add User to Group"
    echo "4. Exit"
    echo -e "${RESET}"

    read -p "Choose an option: " CHOICE

    case $CHOICE in
        1) create_group ;;
        2) create_user ;;
        3) add_user_to_group ;;
        4) exit 0 ;;
        *) echo -e "${RED}Invalid option!${RESET}" ;;
    esac
done

# ========================

