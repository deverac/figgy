Figgy is a server-less <a href='http://www.figlet.org/'>Figlet</a> text generator written in Javascript. The entire app is contained in a single file, which can be opened directly in a browser. The file can also be served from a HTTP server, if desired.

`./src/figlet-fonts.tar.gz` contains the 'contributed' and 'ours' fonts from <a href='http://ftp.figlet.org/pub/figlet/fonts/'>figlet.org</a> and selected fonts from <a href='https://github.com/xero/figlet-fonts/blob/master/Examples.md'>xero</a>.

Any font that does not use plain ASCII chars (e.g. 'ANSI Regular', 'Calvin S', 'DOS Rebel') are intentionally excluded.

<a href='http://ftp.figlet.org/pub/figlet/'>FIGlet C Source</a>
<a href='https://github.com/patorjk/figlet.js/'>FIGlet JS source</a>
<a href='http://www.jave.de/index.html'>ASCII editor</a>

#### Building

    ./build.sh           Creates 'index.html'.
    ./build.sh dist      Creates 'index.html' and removes temp files.
    ./build.sh clean     Removes all generated files.

