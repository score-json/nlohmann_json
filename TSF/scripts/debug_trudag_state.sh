#!/bin/bash

set -u -o pipefail

phase="${1:-unnamed-phase}"

echo "::group::TSF debug snapshot: ${phase}"
echo "[debug] phase=${phase}"
echo "[debug] date_utc=$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo "[debug] pwd=$(pwd)"
echo "[debug] branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo unavailable)"
echo "[debug] revision=$(git rev-parse HEAD 2>/dev/null || echo unavailable)"

echo "[debug] trudag version"
trudag --version 2>&1 || true

echo "[debug] trustable package"
python3 -m pip show trustable 2>&1 || true

echo "[debug] tracked TSF changes"
git status --short --untracked-files=all -- .dotstop.dot .dotstop_extensions TSF 2>&1 || true

echo "[debug] TSF diff summary"
git diff --stat -- .dotstop.dot .dotstop_extensions TSF 2>&1 || true

if [ -f ".dotstop.dot" ]; then
  echo "[debug] .dotstop.dot sha256"
  sha256sum .dotstop.dot 2>&1 || true
fi

if [ -f "TSF/misbehaviours.md" ]; then
  echo "[debug] TSF/misbehaviours.md sha256 and line count"
  sha256sum TSF/misbehaviours.md 2>&1 || true
  wc -l TSF/misbehaviours.md 2>&1 || true
fi

if [ -d "TSF/docs/generated" ]; then
  echo "[debug] generated docs snapshot"
  find TSF/docs/generated -maxdepth 2 -type f | sort | head -n 40
fi

echo "[debug] trudag manage lint"
trudag manage lint
lint_exit=$?
echo "[debug] trudag manage lint exit code: ${lint_exit}"
echo "::endgroup::"