#!/bin/bash

echo "🌀 Ukubona Bootstrap: Creative Destruction"

read -p "💥 Do you want to run destructive.sh first? (y/n): " DESTROY

if [[ "$DESTROY" == "y" ]]; then
  curl -fsSL https://yourdomain.com/destructive.sh | bash
fi

echo "🌱 Now starting creative.sh..."
curl -fsSL https://yourdomain.com/creative.sh | bash

echo "✅ Bootstrap complete. Welcome to Ukubona."
