# ThinkPad T14 Gen 5 AMD - Mint 22 - Fix auto brightness reduction after sleep

> You can also read the article on my blog:
[Fix auto brightness reduction after sleep](https://www.damian-freelance.com/blog/thinkpad-t14-amd-fix-automatic-brightness-reduction-after-sleep-on-linux)

*Tested with Linux Kernel : 6.8*

## To fix auto-dimming brightness after suspend

### step 1/2 - Create script

Create and edit this file:

```bash
sudo nano /usr/local/bin/reset-brightness.sh
```

In this file, Add the content of this scipt:
[Reset Brightnes Script](https://github.com/s-damian/thinkpad-t14-gen-5-amd-linux/blob/main/sh/reset-brightness.sh)

Save and exit.

Make the script executable:

```bash
sudo chmod +x /usr/local/bin/reset-brightness.sh
```

### step 2/2 - Create systemd service

Create and edit this file:

```bash
sudo nano /etc/systemd/system/reset-brightness.service
```

```bash
Add the following content to the file:

[Unit]
Description=Reset screen brightness at startup and after suspend
After=multi-user.target suspend.target hibernate.target hybrid-sleep.target suspend-then-hibernate.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/reset-brightness.sh

[Install]
WantedBy=multi-user.target suspend.target hibernate.target hybrid-sleep.target suspend-then-hibernate.target
```

Save and exit.

Enable and start the service:

```bash
sudo systemctl enable reset-brightness.service
sudo systemctl start reset-brightness.service
sudo systemctl status reset-brightness.service
```