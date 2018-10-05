#!/bin/bash

# Build Docker Image Content

mkdir anordby
cd anordby
git clone git@github.com:anordby/plugins.git
cd ..


docker build -t evermind/icinga2-client:latest .

