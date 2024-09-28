#!/bin/bash

# For path: /lib/systemd/system-sleep/wifi-module-reset.sh

# This script unloads and reloads the Qualcomm WiFi module around suspend

case "$1" in
    pre)
        logger "WiFi reset-module script : ---------- [PRE-SUSPEND START] ----------"
        
        # Before suspend: unload the Qualcomm WiFi module
        logger "WiFi reset-module script : [PRE-SUSPEND START] Unloading Qualcomm WiFi module:"
        modprobe -r ath11k_pci
        if [ $? -eq 0 ]; then
            logger "WiFi reset-module script : [PRE-SUSPEND SUCCESS] Qualcomm module unloaded successfully."
        else
            logger "WiFi reset-module script : [PRE-SUSPEND ERROR] Failed to unload Qualcomm module."
        fi

        logger "WiFi reset-module script : ---------- [PRE-SUSPEND END] ----------"
        ;;
    post)
        logger "WiFi reset-module script : ---------- [POST-RESUME START] ----------"

        # After resume: reload the Qualcomm WiFi module
        logger "WiFi reset-module script : [POST-RESUME START] Reloading Qualcomm WiFi module:"
        modprobe ath11k_pci
        if [ $? -eq 0 ]; then
            logger "WiFi reset-module script : [POST-RESUME SUCCESS] Qualcomm module reloaded successfully."
        else
            logger "WiFi reset-module script : [POST-RESUME ERROR] Failed to reload Qualcomm module."
        fi

        logger "WiFi reset-module script : ---------- [POST-RESUME END] ----------"
        ;;
esac