import 'dart:js_interop';

/// Reference to window.$chatwoot
extension type Chatwoot._(JSObject _) implements JSObject {
  external void toggle(String status); // "open" | "close"
  external void sendMessage(String message);
}

// Access global variable `window.$chatwoot`
@JS(r'$chatwoot')
external Chatwoot? get chatwoot;

class LivechatService {
  static void sendMessage(String message) {
    chatwoot?.toggle("open");
    chatwoot?.sendMessage(message);
  }
}
