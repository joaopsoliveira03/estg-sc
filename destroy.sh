#!/bin/bash
grep config.vm.define Vagrantfile | awk -F'"' '{print $2}' | xargs -P10 -I {} vagrant.exe destroy --force {}