#!/bin/sh
# Baut index.html aus src/app.html (App-Code) für GitHub Pages.
set -e
cd "$(dirname "$0")"
{ echo '<!doctype html><html lang="de"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><meta name="theme-color" content="#F3F5F7"><link rel="manifest" href="manifest.webmanifest"><link rel="apple-touch-icon" href="icon-180.png"><meta name="apple-mobile-web-app-capable" content="yes"><style>:root{padding-top:env(safe-area-inset-top);padding-bottom:env(safe-area-inset-bottom)}body{margin:0}[hidden]{display:none!important}img{max-width:100%}</style>'
  sed -n '1,/<\/style>/p' src/app.html
  echo '</head><body>'
  sed '1,/<\/style>/d' src/app.html
  echo '<script>if("serviceWorker" in navigator)navigator.serviceWorker.register("sw.js")</script></body></html>'
} > index.html
