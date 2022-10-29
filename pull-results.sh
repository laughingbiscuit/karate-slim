rm -rf results
LATEST=$(gh run list -L 1  --json databaseId | jq -r '.[].databaseId')
gh run view --job=$LATEST
gh run download $LATEST
