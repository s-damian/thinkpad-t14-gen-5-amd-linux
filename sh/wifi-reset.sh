#!/bin/bash

# Ce script réinitialise la carte WiFi après la sortie de veille
if [ "$1" = "post" ]; then
    logger "WiFi reset script : ---------- [START] Début de la réinitialisation de la carte WiFi. ----------"

    sleep 1 # (Normalement n'est pas nécéssaire)

    # Trouver l'adresse du périphérique Qualcomm
    DEVICE=$(lspci | grep Qualcomm | awk '{print $1}')
    # Ajouter le préfixe '0000:' à l'adresse du périphérique
    FULL_DEVICE="0000:$DEVICE"

    # Tentative de suppression de la carte WiFi
    #logger "WiFi reset script : [TRY] Tentative de suppression de la carte WiFi..."
    #echo 1 | tee /sys/bus/pci/devices/0000:02:00.0/remove > /dev/null
    logger "WiFi reset script : [TRY] Tentative de suppression de la carte WiFi (PCIe $FULL_DEVICE)..."
    echo 1 | tee /sys/bus/pci/devices/$FULL_DEVICE/remove > /dev/null
    if [ $? -eq 0 ]; then
        logger "WiFi reset script : [SUCCESS] Suppression de la carte WiFi réussie."
    else
        logger "WiFi reset script : [ERROR] lors de la suppression de la carte WiFi."
        exit 1
    fi

    # Tentative de rescan du bus PCIe
    logger "WiFi reset script : [TRY] Tentative de rescan du bus PCIe..."
    echo 1 | tee /sys/bus/pci/rescan > /dev/null
    if [ $? -eq 0 ]; then
        logger "WiFi reset script : [SUCCESS] Rescan du bus PCIe réussi."
    else
        logger "WiFi reset script : [ERROR] lors du rescan du bus PCIe."
        exit 1
    fi

    logger "WiFi reset script : ---------- [END] Réinitialisation de la carte WiFi terminée avec succès. ----------"
fi