#!/usr/bin/env bash

set -euo pipefail

ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$ROOT"

MOCK_BIN=$(mktemp -d)
trap 'rm -rf "$MOCK_BIN"' EXIT

cat > "$MOCK_BIN/sw_vers" <<'EOF'
#!/usr/bin/env bash
case "${1:-}" in
  --productName) echo "macOS" ;;
  --productVersion) echo "0.0" ;;
  --buildVersion) echo "LINT" ;;
esac
EOF
chmod +x "$MOCK_BIN/sw_vers"
export PATH="$MOCK_BIN:$PATH"

CASES=(
  "darwin:amd64:workstation"
  "darwin:arm64:workstation"
  "linux:amd64:workstation"
  "linux:arm64:server"
)

mapfile -d '' TEMPLATES < <(
  find .chezmoiscripts -type f -name '*.sh.tmpl' -print0 | sort -z
)

FAILURES=0
CHECKS=0

for TEMPLATE in "${TEMPLATES[@]}"; do
  for CASE in "${CASES[@]}"; do
    IFS=: read -r OS ARCH MACHINE_TYPE <<< "$CASE"

    if [[ "$TEMPLATE" == .chezmoiscripts/darwin/* && "$OS" != darwin ]]; then
      continue
    fi
    if [[ "$TEMPLATE" == .chezmoiscripts/linux/* && "$OS" != linux ]]; then
      continue
    fi

    OVERRIDE_DATA=$(cat <<EOF
{
  "machineName": "lint",
  "machineType": "$MACHINE_TYPE",
  "defaultBranch": "main",
  "email": "lint@example.invalid",
  "chezmoi": {
    "os": "$OS",
    "arch": "$ARCH"
  }
}
EOF
)

    echo "shellcheck: $TEMPLATE [$OS/$ARCH/$MACHINE_TYPE]"
    CHECKS=$((CHECKS + 1))

    if ! chezmoi \
      --source "$ROOT" \
      execute-template \
      --override-data "$OVERRIDE_DATA" \
      --file "$TEMPLATE" \
      | shellcheck --shell=bash -; then
      FAILURES=$((FAILURES + 1))
    fi
  done
done

echo
if ((FAILURES > 0)); then
  echo "$FAILURES of $CHECKS rendered template checks failed."
  exit 1
fi

echo "All $CHECKS rendered template checks passed."
