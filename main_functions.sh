# Function to store passcode
function store_passcode() {
    # Ask for account and user_id
    echo "Enter the account (e.g. email, web-service): "
    read -r account

    echo "Enter the user ID (e.g. username): "
    read -r user_id

    echo "Enter the passcode: "
    read -r -s passcode  # -s flag hides the input for security

    # Generate timestamp
    timestamp=$(date +"%Y-%m-%d_%H%M_%S")

    # Create file path and store passcode
    file_path="$KEY_VAULT/$account.$user_id.txt"
    
    # Store passcode details in the file
    echo "account: $account\nuser_id: $user_id\npasscode: $passcode\ntimestamp: $timestamp" > "$file_path"

    echo "Passcode for $account ($user_id) saved successfully!"
}

# Function to search and display passcode
function search_passcode() {
    # Ask for keyword to search for
    echo "Enter keyword to search for passcode (e.g. gmail, chasebank): "
    read -r keyword

    # Find and display matching files
    matching_files=$(grep -l "$keyword" "$KEY_VAULT"/*)

    if [ -z "$matching_files" ]; then
        echo "No matching passcodes found."
    else
        echo "Found passcodes matching '$keyword':"
        for file in $matching_files; do
            echo "Displaying passcode from $file:"
            cat "$file"
            echo
        done
    fi
}

# Function to suggest random passcode using openssl
function _generate_random_passcode() {
    echo "Enter the desired length of the passcode: "
    read -r length

    # Define the characters for the passcode
    chars='a-zA-Z0-9!@#$%^&*()_+-=[]{}|;:,.<>?/~'

    # Generate random passcode using openssl
    passcode=$(openssl rand -base64 "$length" | tr -dc "$chars" | head -c "$length")

    # Ensure the passcode is valid and of the correct length
    echo "Suggested random passcode: $passcode"
}

# Function to suggest random passcode using a for loop and modulus
function generate_random_passcode() {
    echo "Enter the desired length of the passcode: "
    read -r length

    # Define the characters for the passcode
    chars='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-=[]{}|;:,.<>?/~\'

    # Initialize an empty string for the passcode
    passcode=""

    # Loop to generate the passcode of the desired length
    for ((i=0; i<length; i++)); do
        # Generate a random number (0-255) using /dev/urandom
        rand_hex=$(od -An -N1 -i /dev/urandom)   # Read one byte from /dev/urandom

        # Get the index by taking the modulus of the random value with the length of chars
        rand_index=$((rand_hex % ${#chars}))

        # Append the selected character to the passcode string
        passcode+="${chars:$rand_index:1}"
    done

    # Output the generated passcode
    echo "Suggested random passcode: $passcode"
}


function check_key_vault_exist(){
    # Define the KEY_VAULT directory path
    KEY_VAULT="./key_vault/passcodes"

    # Check if the key vault directory exists
    if [ ! -d "$KEY_VAULT" ]; then
        # Ensure the key vault directory exists
        mkdir -p "$KEY_VAULT"
        echo "Created directory: $KEY_VAULT"
    else
        echo "Directory exists: $KEY_VAULT"
    fi
}

function print_demarcator(){
    echo "======================================================================="
    echo "======================================================================="
}

function default_action_for_menu() {
    #main_call=$($1)
    echo "You have entered an invallid selection!"
    echo "
        ___           ___           ___           ___           ___     
       /\__\         /\  \         /\  \         /\  \         /\  \    
      /:/ _/_       /::\  \       /::\  \       /::\  \       /::\  \   
     /:/ /\__\     /:/\:\__\     /:/\:\__\     /:/\:\  \     /:/\:\__\  
    /:/ /:/ _/_   /:/ /:/  /    /:/ /:/  /    /:/  \:\  \   /:/ /:/  /  
   /:/_/:/ /\__\ /:/_/:/__/___ /:/_/:/__/___ /:/__/ \:\__\ /:/_/:/__/___
   \:\/:/ /:/  / \:\/:::::/  / \:\/:::::/  / \:\  \ /:/  / \:\/:::::/  /
    \::/_/:/  /   \::/~~/~~~~   \::/~~/~~~~   \:\  /:/  /   \::/~~/~~~~ 
     \:\/:/  /     \:\~~\        \:\~~\        \:\/:/  /     \:\~~\     
      \::/  /       \:\__\        \:\__\        \::/  /       \:\__\    
       \/__/         \/__/         \/__/         \/__/         \/__/    
    
    "
    echo "Please try again!"
    echo ""
    echo "Press any key to continue..."
    read -n 1
    clear
    set -u # force it to treat unset variables as an error 
    unset main_menu_input
    echo ""
    #echo $main_menu_input
    echo "" 
    main

}

