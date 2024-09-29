# ThinkPad T14 Gen 5 AMD - Fix WiFi after sleep - Ubuntu 24.04 / Mint 22

> 📝 You can also read the detailed article on my blog:
[Fix WiFi with Qualcomm QCNFA765 Wireless](https://www.damian-freelance.com/blog/thinkpad-t14-amd-qualcomm-qcnfa765-fix-wifi-on-linux)

🐧 Tested with Linux Kernel: 6.8

## To improve WiFi performance on Linux

Open this file for editing:

```bash
sudo nano /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
```

Replace the line:

```bash
wifi.powersave = 3
```

With:

```bash
wifi.powersave = 2
```

Save and exit.

Restart NetworkManager:

```bash
sudo systemctl restart NetworkManager
```

## To fix slow Wi-Fi after suspend / resume on Linux

*There is an issue where after a few suspend/wake cycles the WiFi card starts to slow down.*

Create and edit this file:

```bash
sudo nano /lib/systemd/system-sleep/reset-wifi-module.sh
```

In this file, Add the content of this scipt:
[Reset WiFi Module Script](https://github.com/s-damian/thinkpad-t14-gen-5-amd-linux/blob/main/sh/reset-wifi-module.sh)

Save and exit.

Make the script executable:

```bash
sudo chmod +x /lib/systemd/system-sleep/reset-wifi-module.sh
```
