#!/usr/bin/sh

set -e

#!/bin/sh

DATE=`date +"%Y-%m-%d-%H%M"`
WRAPPER_LOCATION=$1

/usr/bin/java -jar /hmswork/VeracodeJavaAPI.jar -action passfail -vid 061aff34013705950b50526883bb011f -vkey 716a42dceeb05e9305da7bf52db4bab712bc507943f0aecb5aa21faa81b3806f7a0aae8e992b5d729620d447ff0b58dcd105f97f1cc205454f59bfb6e0af74ff -appname "Pivotal PoC"

sleep 15

/usr/bin/java -jar /hmswork/VeracodeJavaAPI.jar -action passfail -vid 061aff34013705950b50526883bb011f -vkey 716a42dceeb05e9305da7bf52db4bab712bc507943f0aecb5aa21faa81b3806f7a0aae8e992b5d729620d447ff0b58dcd105f97f1cc205454f59bfb6e0af74ff -appname "Pivotal PoC" > /tmp/passfail.csv

sleep 3

cd azure-github-repo
pwsh -file ./passfail.ps1


