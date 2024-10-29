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
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool _isChecked = false;
  bool _switchValue = false;

  final _formKey2 = GlobalKey<FormState>();
  String _dni = '';
  final dniRegex = RegExp(r'^\d{8}$');

  int _selectedValue = 1;
  double _sliderValue = 20.0;

  final List<Map<String, String>> _dropdownItems = [
    {'label': 'Opción A', 'value': '1'},
    {'label': 'Opción B', 'value': '2'},
    {'label': 'Opción C', 'value': '3'},
  ];
  String? _selectedValue2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField Simple')),
      body: SingleChildScrollView( // Añadimos el SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Añadimos padding para que se vea mejor
          child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre',
                      hintText: 'Escribe tu nombre',
                    ),
                    onChanged: (text) {
                      print('Texto ingresado: $text');
                    },
                  ),
                ),
                AppBar(title: Text('TextFormField con Validación')),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Correo Electrónico',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {_email = value; },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingrese un correo';
                            }
                            if (!emailRegex.hasMatch(value)) {
                              return 'Ingrese un correo válido';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print('Correo ingresado: $_email');
                            }
                          },
                          child: Text('Enviar'),
                        ),
                      ],
                    ),
                  ),
                ),
                AppBar(title: Text('DNI Validación')),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey2,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'DNI',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            _dni = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingrese un DNI';
                            }
                            // Aplicar trim() para eliminar espacios
                            if (!dniRegex.hasMatch(value.trim())) {
                              return 'Ingrese un DNI válido de 8 dígitos';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey2.currentState!.validate()) {
                              print('DNI ingresado: $_dni');
                            }
                          },
                          child: Text('Enviar'),
                        ),
                      ],
                    ),
                  ),
                ),
                AppBar(title: Text('Checkbox')),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        },
                      ),
                      Text('Acepto los términos y condiciones: $_isChecked'),
                    ],
                  ),
                ),
                AppBar(title: Text('Switch')),
                Center(
                  child: Switch(
                    value: _switchValue,
                    onChanged: (bool value) {
                      setState(() {
                        _switchValue = value;
                      });
                      print('Switch: $_switchValue');
                    },
                  ),
                ),
                AppBar(title: Text('RadioButton')),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Text('Opción 1'),
                      leading: Radio<int>(
                        value: 1,
                        groupValue: _selectedValue,
                        onChanged: (int? value) {
                          setState(() { _selectedValue = value!; });
                          print("Seleccionado: $_selectedValue");
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Opción 2'),
                      leading: Radio<int>(
                        value: 2,
                        groupValue: _selectedValue,
                        onChanged: (int? value) {
                          setState(() {_selectedValue = value!; });
                          print("Seleccionado: $_selectedValue");
                        },
                      ),
                    ),
                  ],
                ),
                AppBar(title: Text('Slider')),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      label: _sliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {_sliderValue = value;});
                        print("Valor: $_sliderValue");
                      },
                    ),
                    Text('Valor seleccionado: ${_sliderValue.round()}'),
                  ],
                ),

                AppBar(title: Text('DropdownButton con Value y Label distintos')),
                DropdownButton<String>(
                  value: _selectedValue2, // El valor seleccionado
                  hint: Text('Seleccione una opción'), // Texto inicial
                  items: _dropdownItems.map((item) {
                    return DropdownMenuItem<String>(
                      value: item['value'], // Asigna el valor del Map
                      child: Text(item['label']!), // Muestra la etiqueta
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue2 = newValue!;
                    });
                    print('Valor seleccionado: $_selectedValue2'); // Imprime el valor
                  },
                ),
                AppBar(title: Text('Container con diseño')),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: Text(
                    'Hola, Soy un Container',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                AppBar(title: Text('Padding')),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text('Texto con Padding',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                  ),
                ),
                AppBar(title: Text('Expanded Widget')),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        child: Text('Elemento 1', textAlign: TextAlign.center),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.green,
                        child: Text('Elemento 2', textAlign: TextAlign.center),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: Text('Elemento 3', textAlign: TextAlign.center),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black12,
                        child: Text('Elemento 4', textAlign: TextAlign.center),
                      ),
                    ),
                    Text('Dateas', textAlign: TextAlign.center,),
                  ],
                ),


              ]
          ),
        ),
      ),
    );
  }
}
