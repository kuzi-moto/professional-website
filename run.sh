#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
image_name="${IMAGE_NAME:-professional-website-dev}"
src_dir="${SRC_DIR:-$root_dir/src}"
port="${PORT:-1313}"
disable_livereload="${DISABLE_LIVERELOAD:-true}"

# Build the builder stage so the container includes the Hugo binary.
docker build --target builder -t "$image_name" "$root_dir"

# Run the Hugo server from inside the image while mounting the local source.
docker_run_flags=(--rm -p "${port}:1313" -v "${src_dir}:/src")
[[ -t 1 ]] && docker_run_flags+=(-it)

hugo_flags=(
  server
  --source /src
  --bind 0.0.0.0
  --baseURL "http://localhost:${port}"
  --cacheDir /tmp/hugo_cache
  --disableFastRender
  --noHTTPCache
  --renderToMemory
)
[[ "$disable_livereload" == "true" ]] && hugo_flags+=(--disableLiveReload)

exec docker run "${docker_run_flags[@]}" \
  "$image_name" \
  hugo "${hugo_flags[@]}" \
  "$@"
