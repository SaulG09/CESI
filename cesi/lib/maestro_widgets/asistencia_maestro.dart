import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Para formatear la fecha

class AsistenciaScreen extends StatefulWidget {
  @override
  _AsistenciaScreenState createState() => _AsistenciaScreenState();
}

class _AsistenciaScreenState extends State<AsistenciaScreen> {
  final List<String> todosEstudiantes = [
    "Juan",
    "Ana",
    "Luis",
    "Maria",
    "Pedro"
  ];
  List<String> estudiantesFiltrados = [];
  final Map<String, bool> asistencia = {};
  final TextEditingController busquedaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    estudiantesFiltrados = List.from(todosEstudiantes);
    for (var estudiante in todosEstudiantes) {
      asistencia[estudiante] = false;
    }
  }

  // Obtener la fecha actual y formatearla
  String get fechaActual {
    DateTime ahora = DateTime.now();
    return DateFormat('dd/MM/yyyy').format(ahora);
  }

  // Función para guardar la asistencia
  void _guardarAsistencia() {
    // Verificar si el campo de búsqueda está vacío
    if (busquedaController.text.trim().isEmpty) {
      // Mostrar una alerta si el campo de búsqueda está vacío
      Get.snackbar(
        "Advertencia",
        "Por favor, seleccione un grupo antes de guardar la asistencia.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      // Verificar si alguna asistencia ha sido marcada
      bool algunaSeleccionada = asistencia.values.contains(true);
      if (algunaSeleccionada) {
        // Si al menos uno está seleccionado, guardar la asistencia
        Get.snackbar("Asistencia", "Asistencia guardada con éxito",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        Get.back(); // Cierra la pantalla actual o vuelve atrás
      } else {
        // Si no se seleccionó ningún alumno, preguntar si desea guardar la lista vacía
        Get.dialog(
          AlertDialog(
            title: Text("Advertencia"),
            content: Text(
                "No has seleccionado ningún alumno. ¿Deseas guardar la lista vacía?"),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back(); // Cierra el diálogo
                },
                child: Text("Cancelar"),
              ),
              TextButton(
                onPressed: () {
                  Get.back(); // Cierra el diálogo
                  // Mostrar el mensaje de que la asistencia fue guardada aunque no haya seleccionados
                  Get.snackbar("Asistencia", "Asistencia guardada con éxito",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white);
                  Get.back(); // Vuelve a la pantalla anterior
                },
                child: Text("Guardar"),
              ),
            ],
          ),
        );
      }
    }
  }

  // Función para buscar un grupo
  void _buscarGrupo() {
    String busqueda = busquedaController.text.trim().toLowerCase();
    setState(() {
      if (busqueda.isEmpty) {
        estudiantesFiltrados = List.from(todosEstudiantes);
      } else {
        estudiantesFiltrados = todosEstudiantes
            .where((estudiante) => estudiante.toLowerCase().contains(busqueda))
            .toList();
      }
    });
  }

  // Función para cancelar la selección
  void _cancelar() {
    setState(() {
      // Restablecer todos los checkboxes a false
      for (var estudiante in asistencia.keys) {
        asistencia[estudiante] = false;
      }
      // Limpiar el campo de búsqueda
      busquedaController.clear(); // Limpiar el campo de búsqueda
      estudiantesFiltrados =
          List.from(todosEstudiantes); // Restablecer la lista filtrada
    });
    Navigator.pop(context);
  }

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
                      colors: [
                        Color.fromARGB(255, 3, 69, 11),
                        Color.fromARGB(255, 182, 142, 0)
                      ],
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
                    'Asistencia - $fechaActual',
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: busquedaController,
                        decoration: InputDecoration(
                          labelText: "Buscar Grupo",
                          hintText: "Escribe el nombre del grupo",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: _buscarGrupo,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: estudiantesFiltrados.map((nombre) {
                          return CheckboxListTile(
                            title: Text(
                              nombre,
                              style: TextStyle(
                                color: asistencia[nombre]!
                                    ? Colors.green
                                    : Colors.black,
                              ),
                            ),
                            value: asistencia[nombre],
                            activeColor: Colors
                                .green, // Cambia el color del checkbox a verde
                            onChanged: (bool? valor) {
                              setState(() {
                                if (valor != null) {
                                  asistencia[nombre] = valor;
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            ElevatedButton(
              onPressed: _cancelar,
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 15),
                minimumSize: Size(150, 0),
              ),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: _guardarAsistencia,
              child: Text(
                "Guardar Asistencia",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 182, 142, 0),
                padding: EdgeInsets.symmetric(vertical: 15),
                minimumSize: Size(150, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipperTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height - 20,
    );
    path.quadraticBezierTo(
      (size.width * 3) / 4,
      size.height - 60,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
