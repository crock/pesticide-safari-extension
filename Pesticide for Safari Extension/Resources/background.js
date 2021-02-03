// Send a message to the native app extension from the background page.
browser.runtime.sendNativeMessage("application.id", {message: "Hello from Pesticide Safari extension!"}, function(response) {
    console.log(response);
});

// Set up a connection to receive messages from the native app.
let port = browser.runtime.connectNative("application.id");
port.postMessage("Hello from JavaScript Port");
port.onMessage.addListener(function(message) {
    console.log(message);
});
port.onDisconnect.addListener(function(disconnectedPort) {
    console.log(disconnectedPort);
});
