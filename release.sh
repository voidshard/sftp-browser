#! /bin/sh

set -ex

VERSION=0.0.1

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

# build, tag the image
docker build -t sftp-browser:${VERSION} -f Dockerfile .
docker tag sftp-browser:${VERSION} uristmcdwarf/sftp-browser:${VERSION}

# set latest tag
docker tag sftp-browser:${VERSION} uristmcdwarf/sftp-browser:latest

# push the image
docker push uristmcdwarf/sftp-browser:${VERSION}
docker push uristmcdwarf/sftp-browser:latest

cd -
