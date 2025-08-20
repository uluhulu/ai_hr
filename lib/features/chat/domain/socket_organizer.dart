import 'package:ai_hr/features/chat/domain/socket_organizer_streamer.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketOrganizer with SocketOrganizerStreamer {
  late final Socket _socket;
  Socket get socket => _socket;

  void initConnection(String url) {
    _socket = io(
      url,
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .build(),
    );
    connect();

    socket.onConnect((_) {
      socket.on('connect', (_) => connect());
      socket.on('location', (_) => handleLocation());
      socket.on('typing', (_) => handleTyping());
      socket.on('message', (data) => handleMessage(data));
      socket.on('disconnect', (_) => disconnect());
      socket.on('fromServer', (data) => handleMessageFromServer(data)); 
    });
  }
  // This class can be extended with additional functionality if needed.
}
