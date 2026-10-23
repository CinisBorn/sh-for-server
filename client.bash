#!/usr/bin/env bash

URI="${1:?Usage: $0 URI [PROCESSES] [TIMES]}"
PROCESSES="${2:-1}"
TIMES="${3:-100}"

seq 1 "$TIMES" | xargs -I {} -P "$PROCESSES" curl -sS -o /dev/null \
    -w "%{http_code}\t%{time_total}\n" "$URI"  