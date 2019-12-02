#!/bin/sh
# This script is for tag automation.

tags=$(git describe --tags `git rev-list --tags --max-count=1`)
echo $tags
commit=$(git rev-parse HEAD)
echo $commit

# Create next tag.
CHROMIUM_VERSION=$(cat chromium_version.txt)
UNGOOGLED_REVISION=$(cat revision.txt)
UPDATED_TAG="${CHROMIUM_VERSION}-${UNGOOGLED_REVISION}"
echo $UPDATED_TAG

# Post a new tag to repo through GitHub API
echo $REPO_OWNER
curl -s -X POST https://api.github.com/repos/$REPO_OWNER/ungoogled-chromium/git/refs \
-H "Authorization: token $GITHUB_TOKEN" \
-d @- << EOF

{
  "ref": "refs/tags/$UPDATED_TAG",
  "sha": "$commit"
}
EOF
