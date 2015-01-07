#!/usr/bin/env bash
mkdir -p dist
git archive -o dist/taxops.zip HEAD
s3cmd put dist/calendario.zip s3://taxweb-deploy/taxops/taxops.zip
s3cmd setacl s3://taxweb-deploy/taxops/taxops.zip --acl-public
