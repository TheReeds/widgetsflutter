import 'package:flutter/material.dart';
void main() {
  runApp( MyApp());
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
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejemplo de Texto Simple')),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text(
              '¡Hola, Flutter!',
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
            const Text(
              'Texto alineado y estilizado sdsdsdsd',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                wordSpacing: 5,
                color: Colors.purple,
                backgroundColor: Colors.yellow,
              ),
            ),
            RichText(
              text: const TextSpan(
                text: 'Este es un ',
                style: TextStyle(fontSize: 24, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'texto ',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  TextSpan(
                    text: 'rico ',
                    style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green),
                  ),
                  TextSpan(
                    text: 'en estilos.',
                    style: TextStyle(decoration: TextDecoration.underline, color: Colors.red),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('ElevatedButton presionado');
              },
              child: Text('ElevatedButton'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
            TextButton(
              onPressed: () {
                print('TextButton presionado');
              },
              child: Text('TextButton'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                print('OutlinedButton presionado');
              },
              child: Text('OutlinedButton'),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 20),
                side: BorderSide(color: Colors.blue, width: 2), // Define el borde
              ),
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              color: Colors.blue,
              iconSize: 40.0,
              onPressed: () {
                print('IconButton presionado');
              },
            ),
            const Text('Presiona el FAB abajo'),
            ElevatedButton.icon(
              onPressed: () {
                print('Botón con ícono y texto presionado');
              },
              icon: Icon(Icons.send),
              label: Text('Enviar'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ],
        )
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
        print('FAB presionado');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        ),
    );
  }
}