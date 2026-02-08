#!/usr/bin/env bash

# Usage: ./scripts/new-adr.sh "Decision title"

set -e

DECISIONS_DIR="docs/decisions"
TEMPLATE="$DECISIONS_DIR/ADR-template.md"

if [ -z "$1" ]; then
  echo "❌ Error: You must provide a decision title."
  echo "Usage: ./scripts/new-adr.sh \"Autonomous framework\""
  exit 1
fi

# Find the next ADR number
LAST_NUM=$(ls $DECISIONS_DIR/ADR-*.md 2>/dev/null | \
  sed -E 's/.*ADR-([0-9]+).*/\1/' | sort -n | tail -1)

if [ -z "$LAST_NUM" ]; then
  NEXT_NUM=1
else
  NEXT_NUM=$((LAST_NUM + 1))
fi

ADR_NUM=$(printf "%03d" $NEXT_NUM)

# Normalize title for filename
TITLE="$1"
FILE_TITLE=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
FILE="$DECISIONS_DIR/ADR-$ADR_NUM-$FILE_TITLE.md"

# Create ADR
sed "s/ADR-XXX/ADR-$ADR_NUM/g; s/<Title>/$TITLE/g" "$TEMPLATE" > "$FILE"

echo "✅ Created $FILE"
