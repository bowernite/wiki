# WebSockets

## Notes

- With long polling, the client opens an HTTP connection to the server which keeps it open until sending response. Whenever the server actually has new data it sends the response ([source](https://www.html5rocks.com/en/tutorials/websockets/basics/))
- ws:. This is the new URL schema for WebSocket connections. There is also wss: for secure WebSocket connection the same way https: is used for secure HTTP connections. ([source](https://www.html5rocks.com/en/tutorials/websockets/basics/))
- Leverages TCP connections
- "full-duplex" connection: Both parties can send messages and receive at the same time
- Event-based
- Short-coming is that it's only 1-to-1 -- doesn't natively support many clients talking to each other
- WebRTC is alternative geared towards browser-to-browser and audio/video
- New tech that's up-and-coming: WebTransport
  - Basically a better version
  - Faster handshakes
  - Better reliability
- Can send buffers, blobs, or strings
  - Send JSON by stringifying it
- Convoluted handshake process, to ensure both parties are sure their using WebSockets requests ([source](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#server_handshake_response))
- Has a method of streaming where multiple frams for a message come in separately, and the server decodes whether or not to concatenate them
  - Uses a `FIN` bit to tell if the message is still going or not (`1` for finished)
- There's a pinging/ponging mechanism, controlled by a frame's opcode
- Handshake with HTTP, then the TCP connection is opened

## Links

- [The WebSocket API (WebSockets) - Web APIs | MDN](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API)
- [Socket.IO](https://socket.io/)
- [Berkeley sockets - Wikipedia](https://en.wikipedia.org/wiki/Berkeley_sockets)
