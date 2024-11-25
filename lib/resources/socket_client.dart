import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    String serverPath =
        'https://tic-tac-toe-multiplayer-realtime-game.onrender.com/';

    socket = IO.io(serverPath, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    print('** Client Socket request to $serverPath **');

    if (socket == null) {
      print('** Client Failed to Connect to Sockets ***');
      return;
    } else {
      print('** Client Connected to Sockets ***');
    }
    socket!.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
