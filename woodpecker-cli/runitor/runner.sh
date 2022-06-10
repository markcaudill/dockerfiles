#!/bin/bash

last_build_number=$(woodpecker-cli build last --log-level=info --branch="${WOODPECKER_BRANCH}" --format="{{ .Number }}" "${WOODPECKER_REPO}" 2>/dev/null)
woodpecker-cli build start "${WOODPECKER_REPO}" "${last_build_number}"
