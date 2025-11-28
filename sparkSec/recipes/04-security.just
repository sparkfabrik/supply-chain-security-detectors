# vim: set ft=make :

# Security scanning commands for supply-chain detectors repo

[group('security')]
security-scan-npm dir=".":
    #!/usr/bin/env bash
    set -euo pipefail
    DETECTOR_BIN="{{detector_repo_root}}/npm-supply-chain-detector"

    if [[ ! -x "${DETECTOR_BIN}" ]]; then
        echo "❌ Cannot find detector at ${DETECTOR_BIN}."
        echo "Build or fetch the scanner before running this command."
        exit 1
    fi

    "${DETECTOR_BIN}" "{{dir}}"

[group('security')]
security-scan-npm-attack attack dir=".":
    #!/usr/bin/env bash
    set -euo pipefail
    DETECTOR_BIN="{{detector_repo_root}}/npm-supply-chain-detector"

    if [[ ! -x "${DETECTOR_BIN}" ]]; then
        echo "❌ Cannot find detector at ${DETECTOR_BIN}."
        echo "Build or fetch the scanner before running this command."
        exit 1
    fi

    "${DETECTOR_BIN}" -a "{{attack}}" "{{dir}}"

[group('security')]
security-list-attacks:
    #!/usr/bin/env bash
    set -euo pipefail
    DETECTOR_BIN="{{detector_repo_root}}/npm-supply-chain-detector"

    if [[ ! -x "${DETECTOR_BIN}" ]]; then
        echo "❌ Cannot find detector at ${DETECTOR_BIN}."
        echo "Build or fetch the scanner before running this command."
        exit 1
    fi

    "${DETECTOR_BIN}" --list-attacks
