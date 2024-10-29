import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WebSocketChannel channel = WebSocketChannel.connect(
    Uri.parse('ws://echo.websocket.org'),
  );
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WebSocket Example')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Send a message'),
            ),
            SizedBox(height: 20),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  channel.sink.add(_controller.text);
                }
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }



/*String _connectionStatus = 'Unknown';
  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }
  Future<void> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    String status;
    if (connectivityResult == ConnectivityResult.mobile) {
      status = 'Connected to Mobile Network';
    } else if (connectivityResult == ConnectivityResult.wifi) {
      status = 'Connected to WiFi';
    } else {
      status = 'No Internet Connection';
    }
    setState(() {
      _connectionStatus = status;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Network Connectivity')),
      body: Center(
        child: Text('Connection Status: $_connectionStatus'),
      ),
    );
  }*/


}
