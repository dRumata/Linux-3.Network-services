#!/bin/bash
sudo dnf groupinstall 'XFCE Desktop' -y
echo "exec /usr/bin/xfce4-session" >> ~/.xinitrc
