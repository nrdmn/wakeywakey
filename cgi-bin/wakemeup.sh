#!/usr/bin/env sh

MAC_ADDRESS=12:34:56:78:9a:bc

success() {
  echo -ne 'Status: 303 See Other\r\n'
  echo -ne 'Content-Type: text/html\r\n'
  echo -ne 'Location: /index.html\r\n'
  echo -ne '\r\n'

  # Normally, a cgi web server interprets the fake 'Status' header that we sent
  # and copies it to the response's status line. However, python's http server
  # always sends status code 200 before executing this script. This means that
  # the 'Location' header doesn't have any effect when using
  # python http server. To work around this, we additionally send a meta
  # redirect.
  echo '<!doctype html>'
  echo '<meta http-equiv="refresh" content="0; url=/index.html">'
}

error() {
  echo -ne 'Status: 500 Internal Server Error\r\n'
  echo -ne 'Content-Type: text/plain\r\n'
  echo -ne '\r\n'

  echo 'Internal Server Error'
}

wol "$MAC_ADDRESS" && success || error
