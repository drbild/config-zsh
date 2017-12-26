case `uname -s` in
    (Darwin)
        ;&
    (FreeBSD)
	export LSCOLORS="exfxcxdxbxegedabagacad"
	export CLICOLOR=true
	;;
    (Linux)
	;&
    (*)
	export LS_OPTIONS="${LS_OPTIONS} -c -h --group-directories-first"
esac
