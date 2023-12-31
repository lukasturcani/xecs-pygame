# List all commands.
default:
  @just --list

# Do a dev install.
dev:
  pip install -e '.[dev]'

# Run code checks.
check:
  #!/usr/bin/env bash

  error=0
  trap error=1 ERR

  echo
  (set -x; ruff . )

  echo
  ( set -x; black --check . )

  echo
  ( set -x; mypy . )

  test $error = 0

# Auto-fix code issues.
fix:
  black .
  ruff --fix .

# Build a release.
build:
  python -m build
