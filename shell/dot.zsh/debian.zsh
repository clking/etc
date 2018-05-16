function deb_list() {
    if `whence curl`
    then
        fetcher=curl
        opt='-s'
    else
        fetcher=wget
        opt='-qO-'
    fi

    $fetcher $opt $(lsb_release -si \
            | sed -e 's Ubuntu http://packages.ubuntu.com/ ' \
            -e 's Debian https://packages.debian.org/ '
            )/$(lsb_release -sc)/all/$1/filelist \
        | sed -n -e '/<pre>/,/<\/pre>/p' \
        | sed -e 's/<[^>]\+>//g' -e '/^$/d';
}
