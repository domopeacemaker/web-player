if [ -z "$1" ]; then
    url=https://sg.hideip.co/direct/aHR0cDovL2VsY2Fuby50b3Av
else
    url=$1
fi

curl $url --output tele.html

grep -oP '<a href="acestream:\/\/(.*?)" rel="nofollow">(.*?)<\/a>' tele.html | sed -r -e 's|<a href="acestream:\/\/(.*?)" rel="nofollow">(.*?)<\/a>|#EXTINF:\2\nhttp://192.168.1.200/ace/manifest.m3u8?id=\1\n|g' > tele.m3u8
