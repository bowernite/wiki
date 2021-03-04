# WebSockets

## Notes

- With long polling, the client opens an HTTP connection to the server which keeps it open until sending response. Whenever the server actually has new data it sends the response ([source](https://www.html5rocks.com/en/tutorials/websockets/basics/))
- ws:. This is the new URL schema for WebSocket connections. There is also wss: for secure WebSocket connection the same way https: is used for secure HTTP connections. ([source](https://www.html5rocks.com/en/tutorials/websockets/basics/))
- Still over TCP/IP
- "full-duplex" connection: Both parties can send messages and receive at the same time
- Event-based
- Short-coming is that it's only 1-to-1 -- doesn't natively support many clients talking to each other
- WebRTC is alternative geared towards browser-to-browser and audio/video

## Links

- [The WebSocket API (WebSockets) - Web APIs | MDN](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API)
