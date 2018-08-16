#!/bin/bash

cd ~/fabric-tools
export FABRIC_VERSION=hlfv11
./downloadFabric.sh
./startFabric.sh
./createPeerAdminCard.sh
mkdir ~/playground
nohup composer-playground >~/playground/playground.stdout 2>~/playground/playground.stderr & disown
