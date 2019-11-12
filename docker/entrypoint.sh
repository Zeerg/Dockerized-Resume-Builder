#!/bin/bash
source .env

if [[ "$1" == "pdf" ]]; then
    exec python build.py --output_dir "$OUTPUT_DIR"/build --format pdf "$RESUME_PATH"
elif [[ "$1" == "html" ]]; then
    exec python build.py --output_dir "$OUTPUT_DIR"/build --format html "$RESUME_PATH"
fi

# exec other commands if they don't match
exec "$@"