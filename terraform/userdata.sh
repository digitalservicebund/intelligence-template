#!/bin/bash

apt update && apt -y upgrade
apt -y install docker.io

mkdir -p /root/bootstrap

