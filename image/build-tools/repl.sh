#!/bin/bash

set -e

cat >> /tmp/entrypoint.bashrc <<EOF
source /etc/bashrc
source /data1/miniconda3/bin/activate
conda activate drizzlepac_build_env
export TEST_BIGDATA=https://bytesalad.stsci.edu/artifactory
export OMP_NUM_THREADS=4
cd /srv/drizzlepac
EOF

/bin/bash --rcfile /tmp/entrypoint.bashrc
