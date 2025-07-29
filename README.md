Figgy is a server-less [Figlet](http://www.figlet.org/) text generator written in Javascript. The entire app is contained in a single file, which can be opened directly in a browser. The file can also be served from a HTTP server, if desired.

Try it [online](https://deverac.github.io/figgy/).

`./src/figlet-fonts.tar.gz` contains the 'contributed' and 'ours' fonts from [figlet.org](http://ftp.figlet.org/pub/figlet/fonts/) and selected fonts from [xero](https://github.com/xero/figlet-fonts/blob/master/Examples.md).

Any font that does not use plain ASCII chars (e.g. 'ANSI Regular', 'Calvin S', 'DOS Rebel') are intentionally excluded.

[FIGlet C Source](http://ftp.figlet.org/pub/figlet/)

[FIGlet JS source](https://github.com/patorjk/figlet.js/)

[ASCII graphic editor](http://www.jave.de/index.html)

#### Building

    ./build.sh           Creates 'index.html'.
    ./build.sh dist      Creates 'index.html' and removes temp files.
    ./build.sh clean     Removes all generated files.

