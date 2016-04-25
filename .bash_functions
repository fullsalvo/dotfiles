#!/usr/bin/env bash
# Functions to be read into .bashrc

mime ()
{
  mime=$(file -ib "$1")
  simple="${mime%%/*}"
  echo "$simple"
}

ix ()
{
    local OPTIND;
    local OPTS;
    [[ -r ~/.netrc ]] && OPTS='-n';
    while getopts ":hd:l:i:n:" x; do
        case $x in
			# Help
			h)  echo "ix [-d ID] [-i ID] [-n N] [opts]"
			    return
				;;
			# Delete Paste
            d)
                $echo curl $OPTS -X DELETE ix.io/$OPTARG;
                return
				;;
			#
            l)
                curl -s http://ix.io/user/$OPTARG | grep -Po "\<a href=\"\/[a-zA-Z]*\"\>" | sed 's/<a href=\"/http:\/\/ix.io/g;s/\">//g';
                return
				;;
			# Edit Paste
            i)
                OPTS="$OPTS -X PUT";
                local id="$OPTARG"
				;;
			#
            n)
                OPTS="$OPTS -F read:1=$OPTARG"
            ;;
        esac;
    done;
    shift $(($OPTIND - 1));
    [[ -t 0 ]] && {
        local filename="$1";
        shift;
        [[ -n "$filename" ]] && {
            curl $OPTS -F f:1=@"$filename" $* ix.io/$id;
            return
        };
        echo "^C to cancel, ^D to send."
    };
    curl $OPTS -F f:1='<-' $* ix.io/$id
}

tekup ()
{
    files="$@"

    if [[ -z "${files}" ]]; then
	printf 'You must submit a file to be uploaded!\n'
	exit 1
    else
	printf 'Uploading file(s) now!'
	n=1
	for i in "$@"; do
	    printf "\nUploading file #${n} ... "
	    mime=$(mime "${i}")
	    out=$(curl -sf -F file="@${i}" -F contentType="$mime" https://api.teknik.io/v1/Upload)
	    if [[ "${out}" =~ "error" ]]; then
		printf 'error uploading file!\n'
		exit 1
	    else
		out="${out##*Name\":\"}"
		out="${out%%\"*}"
		printf "uploaded!\nYour file can be found at https://u.teknik.io/${out}\n"
	    echo "https://u.teknik.io/${out}" | xclip
	    fi
	    ((n++))
	done
    fi
}

log() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
      --bind "ctrl-m:execute:
                echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R'"
}

cp_p () {
  rsync -WavP --human-readable --progress $1 $2
}

ixio () {
	link=$(curl -sF f:1=@"$1" ix.io $1)
	echo "$link" | xclip && xclip -o
}
