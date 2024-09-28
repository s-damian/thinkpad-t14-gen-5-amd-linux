#!/bin/bash

# Function to reset screen brightness
resetBrightness() {
    logger "resetBrightness script : ---------- [START] ----------"

    sleep 3

    # Path to control screen brightness
    BACKLIGHT_PATH="/sys/class/backlight/amdgpu_bl1"

    if [ ! -f "$BACKLIGHT_PATH/max_brightness" ]; then
        logger "resetBrightness script : [ERROR] Maximum brightness file not found."
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

    logger "resetBrightness script : [INFO] Brightness set to $PERCENTAGE% ($TARGET_BRIGHTNESS)."

    # Verify if brightness was set correctly
    CURRENT_BRIGHTNESS=$(cat $BACKLIGHT_PATH/brightness)
    if [ "$CURRENT_BRIGHTNESS" -eq "$TARGET_BRIGHTNESS" ]; then
        logger "resetBrightness script : [SUCCESS] Brightness set successfully."
    else
        logger "resetBrightness script : [WARNING] The actual brightness ($ACTUAL_BRIGHTNESS) differs from the target ($TARGET_BRIGHTNESS)."
    fi

    logger "resetBrightness script : ---------- [END] ----------"
}

# Exécuter la fonction resetBrightness
resetBrightness