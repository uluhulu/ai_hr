import 'dart:async';

mixin SocketOrganizerStreamer {
  late final StreamController<SocketOrganizerStreamerEvent> _eventController =
      StreamController<SocketOrganizerStreamerEvent>();
  late final Stream<SocketOrganizerStreamerEvent> eventStream =
      _eventController.stream.asBroadcastStream();
  void connect() {
    _eventController.add(
      SocketOrganizerStreamerEvent(
        type: SocketOrganizerStreamerEventType.connect,
      ),
    );
  }

  void handleLocation() {
    _eventController.add(
      SocketOrganizerStreamerEvent(
        type: SocketOrganizerStreamerEventType.location,
      ),
    );
  }

  void handleTyping() {
    _eventController.add(
      SocketOrganizerStreamerEvent(
        type: SocketOrganizerStreamerEventType.typing,
      ),
    );
  }

  void handleMessage(Object data) {
    _eventController.add(
      SocketOrganizerStreamerEvent(
        type: SocketOrganizerStreamerEventType.message,
        data: data,
      ),
    );
  }

  void disconnect() {
    _eventController.add(
      SocketOrganizerStreamerEvent(
        type: SocketOrganizerStreamerEventType.disconnect,
      ),
    );
    _eventController.close();
  }

  void handleMessageFromServer(Object data) {
    _eventController.add(
      SocketOrganizerStreamerEvent(
        type: SocketOrganizerStreamerEventType.fromServer,
        data: data,
      ),
    );
  }
}

enum SocketOrganizerStreamerEventType {
  connect,
  location,
  typing,
  message,
  disconnect,
  fromServer,
}

class SocketOrganizerStreamerEvent {
  final SocketOrganizerStreamerEventType type;
  final Object? data;

  SocketOrganizerStreamerEvent({required this.type, this.data});

  @override
  String toString() {
    return 'SocketOrganizerStreamerEvent(type: $type, data: $data)';
  }
}
