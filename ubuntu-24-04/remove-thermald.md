# ThinkPad T14 Gen 5 AMD - Mint 22 - Remove Thermald error

Thermald is for Intel processors.

So with AMD CPU, with the `sudo systemctl status thermald` command, we have this error:

```bash
thermald[1570]: Unsupported cpu model or platform
```

Since it is useless to leave it enabled, we can disable this service:

```bash
sudo systemctl disable thermald
sudo systemctl stop thermald
sudo systemctl mask thermald
```

Remove Thermald:

```bash
sudo apt remove --purge thermald
```

Clean up any unused packages:

```bash
sudo apt autoremove
```
