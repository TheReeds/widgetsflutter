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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView Scroll',
      home: Scaffold(
        appBar: AppBar(title: Text('ListView Scroll')),
        body: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: 50, // Número de ítems
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Elemento $index'),
            );
          },
        ),
      ),
    );
  }
  /*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejemplo de Scroll',
      home: Scaffold(
        appBar: AppBar(title: Text('SingleChildScrollView')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: List.generate(20, (index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(20),
                color: Colors.blueAccent,
                child: Text('Item $index', style: TextStyle(color: Colors.white, fontSize: 18),),
              );
            }),
          ),
        ),
      ),
    );
  }*/

/*
* @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GridView Scroll',
      home: Scaffold(
        appBar: AppBar(title: Text('GridView Scroll')),
        body: GridView.count(
          crossAxisCount: 2, // Número de columnas
          padding: const EdgeInsets.all(16.0),
          children: List.generate(20, (index) {
            return Container(
              margin: EdgeInsets.all(8.0),
              color: Colors.blueAccent,
              child: Center(
                child: Text(
                  'Item $index',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }*/
}