#!/bin/bash -exu

function main() {
  local pipelines
  pipelines=("consul" "check-a-record" "bosh-test" "gomegamatchers" "infrastructure-ci" "dockerfiles" "bosh-bootloader")

  for pipeline in ${pipelines[@]}; do
    fly -t wings checklist -p "${pipeline}" > "${pipeline}"
  done

  local pipelines
  pipelines=("bootload-mega-ci" "destiny" "etcd")

  for pipeline in ${pipelines[@]}; do
    fly0.7 -t mega checklist -p "${pipeline}" > "${pipeline}"
  done
}

main
