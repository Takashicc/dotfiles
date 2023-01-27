#!/usr/bin/env bash

cd "$(dirname "$0")" > /dev/null

# Copy .config files
cp -R ../.config ~/

# Copy .gitconfig
cp ../.gitconfig ~/
