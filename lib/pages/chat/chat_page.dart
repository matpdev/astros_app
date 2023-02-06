// IO.Socket socket = IO.io(
//   'http://localhost:6060',
//   OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
//       .setExtraHeaders({'authorization': '1'}) // optional
//       .build(),
// );

// late IOWebSocketChannel channel;
// late bool connected;


//   @override
//   void initState() {
//     socket.connect();
//     socket.onConnect((_) {
//       // socket.emit('initial', "{'toId':'2','msg':'Bom dia! Sim, tudo certo!'}");
//     });
//     socket.on('message', (data) => print(data));
//     socket.onDisconnect((_) => print('disconnect'));
//     socket.on('fromServer', (_) => print(_));
//     // channelconnect();
//     super.initState();
//   }

//   void channelconnect() {
//     try {
//       // socket.emit('initial', "{'toId':'2'}");
//       socket.disconnect();
//       // socket.emit('sendTo', "{'toId':'2','msg':'Bom dia! Sim, tudo certo!'}");
//     } catch (e) {
//       print(e);
//     }
//   }
