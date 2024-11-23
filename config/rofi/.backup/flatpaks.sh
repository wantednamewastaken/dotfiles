#!/usr/bin/env bash

flatpak list --app --columns=application | awk -F'.' '{print $NF}' | sort
