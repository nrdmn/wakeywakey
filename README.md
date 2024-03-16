# ☕ wakey wakey

This is a website that displays a button that sends a wake-on-lan request.

You can set the MAC address to be woken up using the `MAC_ADDRESS` variable at
the top of cgi-bin/wakemeup.sh.

To test it locally, you can use python's http server:
`python3 -m http.server --bind localhost --cgi 8000`
and then point your web browser to http://[::1]:8000/.
