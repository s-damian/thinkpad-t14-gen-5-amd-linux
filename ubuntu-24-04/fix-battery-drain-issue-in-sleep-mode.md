# ThinkPad T14 Gen 5 AMD - Ubuntu 24.04 / Mint 22 - Battery drain issue in sleep

> 📝 You can also read the detailed article on my blog:
[Fix battery drain issue in sleep mode](https://www.damian-freelance.com/blog/thinkpad-t14-gen-5-amd-fix-battery-drain-issue-in-sleep-mode-on-linux)

🐧 Tested with Linux Kernel: 6.8

## To fix battery drain issue during suspend mode on Linux

Open your GRUB file for editing:

```bash
sudo nano /etc/default/grub
```

Locate the following line:

```bash
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```

In this line, add `acpi.ec_no_wakeup=1`:

```bash
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi.ec_no_wakeup=1"
```

Save and exit.

Update your GRUB configuration:

```bash
sudo update-grub
```

Reboot:

```bash
sudo reboot
```

## Other articles

See other articles on the same subject:
[Make the ThinkPad T14 Gen 5 AMD compatible with Linux](https://github.com/s-damian/thinkpad-t14-gen-5-amd-linux)