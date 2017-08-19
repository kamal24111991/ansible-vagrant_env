#!/bin/bash

mkdir -p /root/.ssh/
cp /tmp/id_rsa /root/.ssh/id_rsa
cp /tmp/id_rsa.pub /root/.ssh/id_rsa.pub
chmod 600 /root/.ssh/id_rsa*
