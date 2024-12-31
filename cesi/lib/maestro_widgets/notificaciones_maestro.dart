import 'package:cesi/maestro_widgets/home_maestro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para el inputFormatter

class NotificacionesScreen extends StatefulWidget {
  final Color color1;
  final Color color2;
  final Color color3;

  const NotificacionesScreen({
    super.key,
    required this.color1,
    required this.color2,
    required this.color3,
  });

  @override
  State<NotificacionesScreen> createState() => _NotificacionesScreenState();
}

class _NotificacionesScreenState extends State<NotificacionesScreen> {
  final TextEditingController tutorController = TextEditingController();
  final TextEditingController mensajeController = TextEditingController();
  final ValueNotifier<int> importanciaNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> tipoNotifier = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper:
                    WaveClipperTwo(), // Asegúrate de tener el WaveClipperTwo
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [widget.color2, widget.color1],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 80, // Ajusta según lo necesario
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'Generar notificación',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 30),
                // Buscar Tutor - Solo acepta números, letras minúsculas y mayúsculas
                TextField(
                  controller: tutorController,
                  decoration: InputDecoration(
                    labelText: "Buscar Tutor",
                    hintText: "Escribe el nombre o ID del tutor",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search, color: Colors.green[800]),
                      onPressed: () {
                        // Acción para buscar tutor
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green[800]!),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  controller: mensajeController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Escribir Notificación",
                    hintText: "Escribe el mensaje de la notificación",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green[800]!),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ValueListenableBuilder<int>(
                  valueListenable: importanciaNotifier,
                  builder: (context, importancia, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Importancia: ${_getImportanciaText(importancia)}",
                          style: TextStyle(color: Colors.green[800]),
                        ),
                        Slider(
                          activeColor: Colors.green[800],
                          value: importancia.toDouble(),
                          min: 0,
                          max: 2,
                          divisions: 2,
                          label: _getImportanciaText(importancia),
                          onChanged: (value) {
                            importanciaNotifier.value = value.toInt();
                          },
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 20),
                ValueListenableBuilder<int>(
                  valueListenable: tipoNotifier,
                  builder: (context, tipo, child) {
                    return DropdownButton<int>(
                      value: tipo,
                      dropdownColor: Colors.green[100],
                      style: TextStyle(
                          color: const Color.fromARGB(255, 3, 69, 11)),
                      onChanged: (newValue) {
                        if (newValue != null) {
                          tipoNotifier.value = newValue;
                        }
                      },
                      items: [
                        DropdownMenuItem(
                            value: 1, child: Text("Observaciones")),
                        DropdownMenuItem(value: 2, child: Text("Reporte")),
                        DropdownMenuItem(value: 3, child: Text("Emergencia")),
                      ],
                    );
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        tutorController.clear();
                        mensajeController.clear();
                      },
                      child: Text(
                        "Cancelar",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 182, 142, 0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (tutorController.text.isNotEmpty &&
                            mensajeController.text.isNotEmpty) {
                          tutorController.clear();
                          mensajeController.clear();
                          // Mostrar mensaje de éxito
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Notificación enviada"),
                              backgroundColor: Colors.green[800],
                            ),
                          );
                        } else {
                          // Mostrar mensaje de error
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Todos los campos son obligatorios"),
                              backgroundColor: Colors.red[800],
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Enviar",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 182, 142, 0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getImportanciaText(int value) {
    switch (value) {
      case 0:
        return 'Baja';
      case 1:
        return 'Media';
      case 2:
        return 'Alta';
      default:
        return '';
    }
  }
}
