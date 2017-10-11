#!/bin/bash

cd $1

OUT=.htaccess
echo "ErrorDocument 404 https://zh.gluon.ai/404.html" >$OUT
echo "RewriteEngine On" >>$OUT
echo "RewriteCond %{SERVER_PORT} 80" >>$OUT
echo "RewriteRule ^(.*)$ https://zh.gluon.ai/$1 [R,L]" >>$OUT
for f in chapter*/*; do
    echo "Redirect /$f /$(basename $f)" >>$OUT
done
