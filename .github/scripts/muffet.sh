#!/bin/bash

# This script is used in Github Actions to do link checking on commits to branches and main, so
# please edit with care!  See ../workflows/ci.yml for specific usage.
#
# If you're doing local development and want to run link checkers locally, please use this script!
# You'll need:
# - install go - https://golang.org/doc/install
# - install muffet - https://github.com/raviqqe/muffet
# - make sure muffet is in your PATH
# - run from root of this repo: ./.github/scripts/muffet.sh
#
# If we have errors from this script being too aggressive (see how large downloads on
# download.docker.com are excluded below) you can add additional sites as needed. Please
# use extremely granular URLs so as not to exclude more than we need to.

muffet http://localhost:1313 \
  --buffer-size 50000 \
  --timeout 35 \
  --concurrency 2 \
  --ignore-fragments \
  --exclude ".*demo\.app\.medicmobile\.org.*" \
  --exclude ".*download\.docker\.com.*" \
  --exclude ".*www\.npmjs\.com/org/medic/team/developers" \
  --exclude "https://github\.com/medic/cht-docs/issues/new.*" \
  --exclude "https://github\.com/medic/cht-core/issues/new.*" \
  --exclude "https://github\.com/medic/cht-docs/commit.*" \
  --exclude "https://github\.com/medic/cht-core/commit.*" \
  --exclude "https://github\.com/medic/cht-docs/edit/main/.*" \
  --exclude "https://github.com/orgs/medic/projects/19" \
  --exclude "https://github.com/orgs/medic/projects/38" \
  --exclude "https://github.com/medic/medic-infrastructure*" \
  --exclude "http[s]*://localhost[8443|5984]*" \
  --exclude "http[s]*://.*my.local-ip.co*" \
  --exclude "http[s]*://cht\.domain\.com.*" \
  --exclude "http[s]*://127\.0\.0*" \
  --exclude "http[s]*://.*rapidpro.io.*" \
  --exclude "http[s]*://.*africastalking.com*" \
  --exclude "http[s]*://.*udemy.com.*" \
  --exclude "http[s]*://.*notion.so.*" \
  --exclude "http[s]*://.*medium.com.*" \
  --exclude "http[s]*://.*twitter.com.*" \
  --exclude "https://tools.google.com.*" \
  --exclude "https://fhir.org/" \
  --exclude "https://docs.google.com/spreadsheets/d/12345ABCDEF/.*" \
  --exclude "https://docs.google.com/document/d/14AuJ7SerLuOPESBjQlJqpBtzwSAoVf5ykTT7fjyJBT0/*" \
  --exclude "https://drive.google.com/file/d/1YPXoba9gVmD7SP-X88PpJIsIVGvY86_G.*" \
  --exclude "https://journals.sagepub.com/doi/full/10.1177/20552076231194924" \
  --exclude "https://doi.org/10.1080/02681102.2019.1667289" 
