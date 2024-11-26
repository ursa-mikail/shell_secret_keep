# Load helper functions
source "$(dirname "$0")/main_functions.sh"

# Print menu options
function print_menu() {
    echo "1. Store passcode"
    echo "2. Search and display passcode"
    echo "3. Suggest random passcode"   
    echo "x|X. Exit"
}

# Main function to handle user input
function main() {
    check_key_vault_exist;

    while true; do
        print_menu
        read -p "Input Selection: " main_menu_input
        echo ""

        case "$main_menu_input" in
            1) store_passcode ;; 
            2) tree ./key_vault ; search_passcode ;;
            3) generate_random_passcode ;;
            x|X) exit 0 ;;
            *) default_action_for_menu; echo "Invalid option. Please try again." ;;
        esac

        print_demarcator
    done
}

# This builds the main menu and routs the user to the function selected.
main # This executes the main menu function.

echo ""
: <<'COMMENT_SECTION'


COMMENT_SECTION
echo ""


