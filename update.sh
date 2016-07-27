#!/bin/bash -exu

function main() {
  local pipelines
  pipelines=("bootload-mega-ci" "bosh-bootloader" "bosh-test" "consul" "check-a-record" "destiny" "etcd" "gomegamatchers" "mega-ci")

  for pipeline in ${pipelines[@]}; do
    fly -t mega checklist -p "${pipeline}" > "${pipeline}"
  done
}

main
