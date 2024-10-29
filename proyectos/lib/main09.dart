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
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Diálogos y Snackbars')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Mostrar un diálogo de alerta
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Diálogo de Alerta'),
                      content: Text('Este es un diálogo de alerta.'),
                      actions: [
                        TextButton(
                          onPressed: () { Navigator.of(context).pop(); },
                          child: Text('Cerrar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Mostrar Diálogo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Este es un Snackbar.'),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'Deshacer',
                      onPressed: () {print("Holas");},
                    ),
                  ),
                );
              },
              child: Text('Mostrar Snackbar'),
            ),
          ],
        ),
      ),
    );
  }

}
class SecondPage extends StatelessWidget {
  final String message;
  SecondPage({required this.message});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Segunda Página')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Regresar a la Página Principal'),
            ),
          ],
        ),
      ),
    );
  }
}
