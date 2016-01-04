#!/usr/bin/env bash

declare interval
declare recursive=false
declare -a images
declare -a search_dirs
declare verbose=false

err() {
	echo -e "\e[31m$1\e[0m" >&2
}

die() {
	[[ -n "$1" ]] && err "$1"
	exit 1
}

while :; do
	case "$1" in
		-v|--verbose)
			unset verbose
			shift
			;;
		-r|--recursive)
			unset recursive
			shift
			;;
		-i|--interval)
			if [[ "$2" =~ ^[0-9]+$ ]]; then
				interval="$2"
				shift 2
			fi
			;;
		*)
			if [[ -d "$1" ]]; then
				search_dirs+=( "$1" )
				shift
			elif [[ -f "$1" ]]; then
				if [[ "$1" =~ \.(jpeg|jpg|png)$ ]]; then
					images+=( "$1" )
				elif [[ -z $verbose ]]; then
					err "$1 is not an acceptable file, must be png or jpg"
				fi
				shift
			else
				break
			fi
			;;
	esac
done

if (( ${#search_dirs[@]} > 0 )); then
	for d in "${search_dirs[@]}"; do
		files=$(find $(realpath "$d") ${recursive:+-maxdepth 1} -iregex '.*\.\(jpeg\|jpg\|png\)')
		mapfile -t -O ${#images[@]} images <<< "$files"
	done
fi

[[ -z $verbose ]] && echo "${#images[@]} images found"

if (( ${#images[@]} < 1 )); then
	die 'No images found'
elif (( ${#images[@]} == 1 )); then
	feh --bg-fill ${images[@]}
	exit
fi

while true; do
	printf '%s\n' "${images[@]}" | shuf | while IFS= read -r image; do
		[[ -z $verbose ]] && echo "Loading $image"
		feh --bg-fill "$image"
		sleep ${interval:-60}
	done
done
