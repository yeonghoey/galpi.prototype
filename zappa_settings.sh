#!/usr/bin/env bash

set -exuo pipefail

readonly REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

(
  cd "${REPO}/aws"
  terraform refresh
  terraform output "zappa_settings" |  tee "${REPO}/zappa_settings.json"
)
