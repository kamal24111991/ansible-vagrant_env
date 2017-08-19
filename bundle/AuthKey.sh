#!/bin/bash

mkdir -p /root/.ssh/
cp /tmp/authorized_keys /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
