LATEST=$(gh run list -L 1  --json databaseId | jq -r '.[].databaseId')
gh run download $LATEST
