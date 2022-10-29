rm -rf results
LATEST=$(gh run list -L 1  --json databaseId | jq -r '.[].databaseId')
gh run view $LATEST
gh run download $LATEST
