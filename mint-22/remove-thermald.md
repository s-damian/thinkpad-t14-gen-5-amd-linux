# Linux Mint 22 / AMD CPU - Remove Thermald error

> 📝 You can also read the article on my blog:
[Remove Thermald error on Mint 22 / AMD CPU](https://www.damian-freelance.com/blog/amd-cpu-fix-thermald-error-on-linux-mint)

## To fix the Thermald service error on AMD CPUs running Mint 22

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

If you want, you can completely uninstall termald:

```bash
sudo apt remove --purge thermald
```

Clean up any unused packages:

```bash
sudo apt autoremove
```
