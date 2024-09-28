#!/bin/bash

# For path: /usr/local/bin/reset-brightness.sh

# Function to reset screen brightness
resetBrightness() {
    logger "Reset-Brightness-Script : ---------- [START] ----------"

    sleep 3

    # Path to control screen brightness
    BACKLIGHT_PATH="/sys/class/backlight/amdgpu_bl1"

    if [ ! -f "$BACKLIGHT_PATH/max_brightness" ]; then
        logger "Reset-Brightness-Script : [ERROR] Maximum brightness file not found."
        exit 1
    fi

    # Set brightness to 60%
    PERCENTAGE=60

    # Get the maximum brightness value
    MAX_BRIGHTNESS=$(cat $BACKLIGHT_PATH/max_brightness)

    # Calculer la luminosité cible en fonction du pourcentage
    TARGET_BRIGHTNESS=$((MAX_BRIGHTNESS * PERCENTAGE / 100))

    # Calculate the target brightness based on the percentage
    echo $TARGET_BRIGHTNESS | sudo tee $BACKLIGHT_PATH/brightness > /dev/null

    logger "Reset-Brightness-Script : [INFO] Brightness set to $PERCENTAGE% ($TARGET_BRIGHTNESS)."

    # Verify if brightness was set correctly
    CURRENT_BRIGHTNESS=$(cat $BACKLIGHT_PATH/brightness)
    if [ "$CURRENT_BRIGHTNESS" -eq "$TARGET_BRIGHTNESS" ]; then
        logger "Reset-Brightness-Script : [SUCCESS] Brightness set successfully."
    else
        logger "Reset-Brightness-Script : [WARNING] The actual brightness ($ACTUAL_BRIGHTNESS) differs from the target ($TARGET_BRIGHTNESS)."
    fi

    logger "Reset-Brightness-Script : ---------- [END] ----------"
}

# Run the resetBrightness function
resetBrightness