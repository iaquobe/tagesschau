#!/bin/bash

install -c ./tagesschau-schauer ~/.local/bin
mkdir -p ~/.local/share/systemd/user/
cp ./tagesschau-schauer.service ~/.local/share/systemd/user/

envsubst < ./tagesschau-schauer.service > ~/.local/share/systemd/user/tagesschau-schauer.service
cp ./tagesschau-schauer.timer ~/.local/share/systemd/user/
systemctl --user daemon-reload

systemctl --user daemon-reload
systemctl --user enable tagesschau-schauer.service
systemctl --user start tagesschau-schauer.service

