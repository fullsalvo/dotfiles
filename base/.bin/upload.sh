#!/usr/bin/env bash
# name: teknik-upload
# creator: KittyKatt
# requires: bash 4.0+, curl

# Common Functions/Variables
displayUsage() {
    printf "
Teknik Upload Script in BASH

Usage : $(basename ${0}) -[ e (s) | d  | h ]
Options:
  -h, --help\t Display this help message.
  -d, --deletion\t Generate a deletion key."
}

# Options
while getopts ":heds" flags; do
	case $flags in
		h) displayUsage; exit 0 ;;
		d) deletion="1"; shift ;;
		?) printf "Error! That flag doesn't exist."; exit 1 ;;
	esac
done

# Let's build our request
# Defaults: encryption, server-side savekey
files="$@"
encrypt="true"
savekey="true"
deletionkey="false"
if [[ "${deletion}" == "1" ]]; then
	deletionkey="true"
fi

# Main
if [[ -z "${files}" ]]; then
	printf 'You must submit a file to be uploaded!\n'
	exit 1
else
	printf 'Uploading file(s) now!'
	n=1
	for i in "$@"; do
		# Upload those files!
		printf "\nUploading file #${n} . . . "
		# Special case for .png files
		iext="${i##*.}"
		if [[ "${iext}" == "png" || "${iext}" == "PNG" ]]; then
			out=$(curl -sf -F "contentType=image/png" -F "encrypt=${encrypt}" -F "saveKey=${savekey}" -F "genDeletionKey=${deletionkey}" -F file="@${i}" https://api.teknik.io/v1/Upload)
		else
			out=$(curl -sf -F "encrypt=${encrypt}" -F "saveKey=${savekey}" -F "genDeletionKey=${deletionkey}" -F file="@${i}" https://api.teknik.io/v1/Upload)
		fi
		if [[ "${out}" =~ "error" ]]; then
			printf 'error uploading file!\n'
			exit 1
		else
			id="${out##*Name\":\"}"
			id="${id%%\"*}"
			printf "uploaded! Your file can be found at https://u.teknik.io/${id}\n"
			if [[ "${deletionkey}" == "true" ]]; then
				dkey="${out##*deletionKey\":\"}"
				dkey="${dkey%%\"*}"
				printf "(Deletion Key: ${dkey})"
			fi
		fi
		((n++))
	done
fi
