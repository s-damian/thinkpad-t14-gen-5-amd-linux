#!/bin/bash

# For path: /lib/systemd/system-sleep/reset-wifi-module.sh

# This script unloads and reloads the Qualcomm WiFi module around suspend

case "$1" in
    pre)
        logger "Reset-WiFi-Module-Script : ---------- [PRE-SUSPEND START] ----------"
        
        # Before suspend: unload the Qualcomm WiFi module
        logger "Reset-WiFi-Module-Script : [PRE-SUSPEND START] Unloading Qualcomm WiFi module:"
        modprobe -r ath11k_pci
        if [ $? -eq 0 ]; then
            logger "Reset-WiFi-Module-Script : [PRE-SUSPEND SUCCESS] Qualcomm module unloaded successfully."
        else
            logger "Reset-WiFi-Module-Script : [PRE-SUSPEND ERROR] Failed to unload Qualcomm module."
        fi

        logger "Reset-WiFi-Module-Script : ---------- [PRE-SUSPEND END] ----------"
        ;;
    post)
        logger "Reset-WiFi-Module-Script : ---------- [POST-RESUME START] ----------"

        # After resume: reload the Qualcomm WiFi module
        logger "Reset-WiFi-Module-Script : [POST-RESUME START] Reloading Qualcomm WiFi module:"
        modprobe ath11k_pci
        if [ $? -eq 0 ]; then
            logger "Reset-WiFi-Module-Script : [POST-RESUME SUCCESS] Qualcomm module reloaded successfully."
        else
            logger "Reset-WiFi-Module-Script : [POST-RESUME ERROR] Failed to reload Qualcomm module."
        fi

        logger "Reset-WiFi-Module-Script : ---------- [POST-RESUME END] ----------"
        ;;
esac