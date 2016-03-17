#!/usr/bin/env bash

declare esc=$(printf '\033')
declare c_reset="${esc}[0m"
declare c_red="${esc}[31m"
declare c_blue="${esc}[34m"

info() {
  echo -e "${c_blue}$1${c_reset}" >&2
}

err() {
  echo -e "${c_red}$1${c_reset}" >&2
}

die() {
  [[ -n "$1" ]] && err "$1"
  exit 1
}

declare verbose=0

while true; do
  case "$1" in
    -v|--verbose) (( verbose++ )) ; shift ;;
    *) break
  esac
done

(( $# < 1 )) && die 'You must submit a file to be uploaded!'

for (( i=1; i <= $#; i++ )); do
  file="$1" && shift
  # info "Uploading file #${i} ... "
  post=$(curl -sf -F "genDeletionKey=true" -F file="@${file}" https://api.teknik.io/v1/Upload)
  (( verbose > 0 )) && info "response: $post"
  [[ -z "$post" || "$post" != *'http'* || "${post}" =~ 'error' ]] && die 'error uploading file!'
  url=$(grep -oP 'https://[[:alnum:]?=%/_.:,;~@!#$&()*+-]+' <<< "$post")
  echo "$url"
done
