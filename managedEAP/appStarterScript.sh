#!/bin/bash
#added & to start EAP in the background and using top commoand as a blocker, so that the container does not exit when EAP is shutdown from JON

$HOME/eap/jboss-eap-6.1/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 &
top

