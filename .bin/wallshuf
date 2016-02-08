#!/usr/bin/env bash

################
# Declarations #
################
declare program
declare blurvalue
declare tintvalue
declare duration=60
declare recursive=false
declare verbose=false
declare oneshot=false
declare bold="$(tput bold)"
declare italic="$(tput sitm)"
declare reset="$(tput sgr0)"
declare -a images
declare -a search_dirs

#############
# Functions #
#############
err() {
	echo -e "\e[31m$1\e[0m" >&2
}

die() {
	[[ -n "$1" ]] && err "$1"
	exit 1
}

inpath() {
	type "$1" &> /dev/null
}

usage() {
	more <<-'HELP'
wallshuffle.sh - wallpaper shuffling script
Usage: wallshuffle.sh [OPTION]... IMAGE OR DIRECTORY...

-d NUMBER  - Set duration (in seconds) between wallpaper changes (default: 60)
-p PROGRAM - Set which program to use; either 'hsetroot' or 'feh'
-o         - Set a random wallpaper once and quit
-r         - Recursively find images in directories
-h         - Print this help information
-v         - Enable verbose output

The following options only work if hsetroot is used
-b NUMBER  - Set blur radius
-t NUMBER  - Set tint value (#FFFFFF is no change)
HELP
}

###########
# Options #
###########
while getopts ':vrd:hob:p:t:' option; do
	case "$option" in
		h)
			usage
			exit
			;;
		p)
			program="$OPTARG"
			;;
		b)
			blurvalue="$OPTARG"
			;;
		t)
			tintvalue="$OPTARG"
			;;
		o)
			unset oneshot
			;;
		v)
			unset verbose
			;;
		r)
			unset recursive
			;;
		d)
			if [[ "$OPTARG" =~ ^[0-9]+$ ]]; then
				duration="$OPTARG"
			fi
			;;
		\?)
			err "-$OPTARG is not a valid option"
			;;
	esac
done
shift $((OPTIND-1))

# If the program was specified, make sure it's valid...
if [[ -n "$program" ]]; then
	case "$program" in
		hsetroot)
			if ! inpath hsetroot; then
				echo 'Specified program 'hsetroot' is not in $PATH'
				if inpath feh; then
					echo 'Falling back to feh'
					program="feh"
				else
					echo 'feh not found in $PATH either'
					exit 1
				fi
			fi
			;;
		feh)
			if ! inpath feh; then
				echo 'Specified program 'feh' is not in $PATH'
				if inpath hsetroot; then
					echo 'Falling back to hsetroot'
					program="hsetroot"
				else
					echo 'hsetroot not found in $PATH either'
					exit 1
				fi
			fi
			;;
		*)
			echo 'Valid arguments for -p are "hsetroot" and "feh"'
			exit 1
			;;
	esac
# ...otherwise, determine the program automatically
else
	if inpath hsetroot; then
		program="hsetroot"
	elif inpath feh; then
		program="feh"
	else
		echo "This script depends on either hsetroot or feh"
		exit 1
	fi
fi

# If no images are provided, show usage and exit
if [[ -z "$1" ]]; then
	usage
	exit 1
fi

if [[ -z $verbose ]]; then
	echo "Using $program"
fi

if [[ -n "$blurvalue" ]]; then
	# Currently equivalent to [[ -n "$blurvalue" && "$program" == feh ]]
	# But this will make adding support for more programs easier
	case $program in
		feh)
			err "-b can only be used with hsetroot"
			;;
	esac
fi

if [[ -n "$tintvalue" ]]; then
	case $program in
		feh)
			err "-t can only be used with hsetroot"
			;;
	esac
fi

for argument in $@; do
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
	fi
done

if (( ${#search_dirs[@]} > 0 )); then
	for d in "${search_dirs[@]}"; do
		files=$(find $(realpath "$d") ${recursive:+-maxdepth 1} -iregex '.*\.\(jpeg\|jpg\|png\)')
		mapfile -t -O ${#images[@]} images <<< "$files"
	done
fi

if (( ${#images[@]} < 1 )); then
	die 'No images found'
elif (( ${#images[@]} == 1 )) && [[ -z $verbose ]]; then
	echo "1 image found"
elif (( ${#images[@]} > 1 )) && [[ -z $verbose ]]; then
	echo "${#images[@]} images found"
fi

if (( ${#images[@]} == 1 )) || [[ -z "$oneshot" ]]; then
	if [[ -z "$oneshot" ]]; then
		mapfile -t images < <(printf '%s\n' "${images[@]}" | shuf)
	fi
	[[ -z $verbose ]] && echo "Loading ${images[0]}"
	case $program in
		hsetroot)
			hsetroot -fill "${images[0]}" -blur ${blurvalue:-0} -tint ${tintvalue:-#ffffff}
			;;
		feh)
			feh --bg-fill "${images[0]}"
			;;
	esac
	exit
fi

while true; do
	printf '%s\n' "${images[@]}" | shuf | while IFS= read -r image; do
		[[ -z $verbose ]] && echo "Loading $image"
		case $program in
			hsetroot)
				hsetroot -fill "$image" -blur ${blurvalue:-0} -tint ${tintvalue:-#ffffff}
				;;
			feh)
				feh --bg-fill "$image"
				;;
		esac
		sleep $duration
	done
done
