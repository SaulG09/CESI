import 'package:flutter/material.dart';

class NotificacionesTutor extends StatefulWidget {
  final Color color1;
  final Color color2;
  final Color color3;

  const NotificacionesTutor({
    super.key,
    required this.color1,
    required this.color2,
    required this.color3,
  });

  @override
  State<NotificacionesTutor> createState() => _NotificacionesTutorState();
}

class _NotificacionesTutorState extends State<NotificacionesTutor> {
  String selectedType = 'Todos';
  String selectedStudent = 'Todos';

  // Ejemplo de notificaciones
  List<Notification> notifications = [
    Notification('Juan Pérez', 'Se ha registrado una nueva observación.', 'observación'),
    Notification('María López', 'Se requiere atención inmediata.', 'emergencia'),
    Notification('Pedro Sánchez', 'Un nuevo reporte está disponible.', 'reporte'),
    Notification('Ana Torres', 'Notificación de prueba.', 'observación'),
    Notification('Luis Gómez', 'Emergencia en el área.', 'emergencia'),
  ];

  @override
  Widget build(BuildContext context) {
    // Generar tipos y nombres de estudiantes dinámicamente basados en la lista de notificaciones
    List<String> notificationTypes = ['Todos'] + notifications.map((n) => n.type).toSet().toList();
    List<String> studentNames = ['Todos'] + notifications.map((n) => n.student).toSet().toList();

    // Filtrar notificaciones según los seleccionados
    List<Notification> filteredNotifications = notifications.where((notification) {
      bool matchesType = selectedType == 'Todos' || notification.type.toLowerCase() == selectedType.toLowerCase();
      bool matchesStudent = selectedStudent == 'Todos' || notification.student == selectedStudent;
      return matchesType && matchesStudent;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [widget.color1, widget.color2],
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30), // Espacio para el encabezado
                Center(
                  child: Text(
                    'Notificaciones',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 100), // Espacio entre el título y los dropdowns
                // Fila para los DropdownButtons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Centrar los dropdowns
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: widget.color1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedType,
                          icon: const Icon(Icons.arrow_downward, color: Colors.white),
                          dropdownColor: widget.color1,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedType = newValue!;
                            });
                          },
                          items: notificationTypes.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(value, style: const TextStyle(color: Colors.white)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: widget.color2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedStudent,
                          icon: const Icon(Icons.arrow_downward, color: Colors.white),
                          dropdownColor: widget.color2,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedStudent = newValue!;
                            });
                          },
                          items: studentNames.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(value, style: const TextStyle(color: Colors.white)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredNotifications.length,
                    itemBuilder: (context, index) {
                      final notification = filteredNotifications[index];
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            notifications.remove(notification);
                          });
                          // Actualizar los dropdowns
                          notificationTypes = ['Todos'] + notifications.map((n) => n.type).toSet().toList();
                          studentNames = ['Todos'] + notifications.map((n) => n.student).toSet().toList();
                          
                        },
                        child: Card(
                          color: Colors.white,
                          margin: const EdgeInsets.all(5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: getColorForType(notification.type),
                                  child: const Icon(Icons.notifications, color: Colors.white),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        notification.student,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        notification.text,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        notification.type,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: getColorForType(notification.type),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color getColorForType(String type) {
    switch (type.toLowerCase()) {
      case 'observación':
        return widget.color1;
      case 'emergencia':
        return widget.color2;
      case 'reporte':
        return widget.color3;
      default:
        return Colors.grey;
    }
  }
}

class Notification {
  final String student;
  final String text;
  final String type;

  Notification(this.student, this.text, this.type);
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
