# /bin/bash
# 帮助同步 .yarnrc .npmrc
tmp_dir=$(dirname $(dirname "${BASH_SOURCE}"))
cd "$tmp_dir"
PROJECT_ROOT=$(pwd)
RUN_ROOT=/$(pwd)

set -o errexit
set -o nounset
set -o pipefail

pngdirs=$(find "${PROJECT_ROOT}/data" -type d -maxdepth 20);

echo "find done.";

for pngdir in $pngdirs
do
    bn=$(basename $pngdir)
    if [[ "$bn" = @(data|quiz) ]]; then
        echo "skip $bn";
    else
        find "$pngdir" -maxdepth 1 -type f -print | xargs -I {} mv {} "${PROJECT_ROOT}/data"
    fi
done