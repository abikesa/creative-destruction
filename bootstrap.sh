#!/bin/bash

echo "🌀 Ukubona Bootstrap: Creative Destruction"

read -p "💥 Do you want to run destructive.sh first? (y/n): " DESTROY

if [[ "$DESTROY" == "y" ]]; then
  echo "🔥 Running destructive.sh..."
  curl -fsSL https://raw.githubusercontent.com/abikesa/creative-destruction/main/destructive.sh | bash
else
  echo "⚠️ Skipping destructive.sh"
fi

echo "🌱 Now starting creative.sh..."
curl -fsSL https://raw.githubusercontent.com/abikesa/creative-destruction/main/creative.sh | bash

echo "✅ Bootstrap complete. Welcome to Ukubona."
