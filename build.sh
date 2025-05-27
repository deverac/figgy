#!/bin/bash
set -e

SRC_HTML='./src/template.html'
TGT_HTML='index.html'

DIR='fonts' # Not arbitrary. Default path in Figlet source.


if [ "$1" = "clean" ]; then
    rm -rf figlet-fonts
    rm -rf fonts
    rm -f index.html
    exit
fi


tar -xzf ./src/figlet-fonts.tar.gz

# Copy all fonts into a single directory. Any same-named fonts will be overwritten.
rm -rf fonts
mkdir fonts
cd figlet-fonts
    for fontdir in contributed contributed/bdffonts contributed/C64-fonts ours xero; do
        cp ./$fontdir/*.flf  ../fonts
    done
cd ..

# Generate HTML file.
(
    sed -e '/XXXX_PLACEHOLDER_XXXX/,$d' $SRC_HTML
    
    echo "<script type='text/javascript'>"

    # Base64-encode each figlet font
    echo "const fontDict = {"
    for nam in `ls ./$DIR`; do
       echo '"'${nam::-4}'": `'
       base64 ./$DIR/$nam
       echo '`,'
    done
    echo "}"

    cat << EOF
      const ALL_FONTS = Object.keys(fontDict).sort()

      // Override fetch() function.
      function fetch(fontStr) {
          const dirName = figlet.defaults().fontPath + '/'
          const extName = '.flf'
          const keyName = fontStr.substring(dirName.length, fontStr.length-extName.length)
          const b64data = fontDict[keyName] || fontDict[KEYS[0]]

          return Promise.resolve({
              ok: true,
              text: () => atob(b64data), // Decode Base64 data.
          })
      }
EOF

    # Include Figlet source
    cat ./figlet/figlet.js

    echo "</script>"

    sed -e '1,/XXXX_PLACEHOLDER_XXXX/d' $SRC_HTML
) > $TGT_HTML



if [ "$1" = "dist" ]; then
    rm -rf figlet-fonts
    rm -rf fonts
    exit
fi
