import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class InformacionSeleccionTutor extends StatefulWidget {
  final Color color1;
  final Color color2;
  final Color color3;

  const InformacionSeleccionTutor({
    super.key,
    required this.color1,
    required this.color2,
    required this.color3,
  });

  @override
  _InformacionSeleccionTutorState createState() => _InformacionSeleccionTutorState();
}

class _InformacionSeleccionTutorState extends State<InformacionSeleccionTutor> {
  int tipoVista = 0;

  void cambiarVista() {
    setState(() {
      tipoVista = 1;
    });
  }

  void cambiarVista2() {
    setState(() {
      tipoVista = 2;
    });
  }

  void cambiarVista3() {
    setState(() {
      tipoVista = 3;
    });
  }

  void cambiarVista4() {
    setState(() {
      tipoVista = 4;
    });
  }

  void cambiarVista5() {
    setState(() {
      tipoVista = 5;
    });
  }

   void cambiarVista6() {
    setState(() {
      tipoVista = 0;
    });
  }

  // Lista de elementos para el GridView
  final List<Map<String, String>> items = [
    {
      'image': 'lib/images/placeholder.webp',
      'text1': 'Responsable 1',
    },
    {
      'image': 'lib/images/placeholder.webp',
      'text1': 'Responsable 2',
    },
    {
      'image': 'lib/images/placeholder.webp',
      'text1': 'Responsable 3',
    },
    // Agrega más elementos según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: tipoVista == 0
            ? _buildSeleccion()
            : tipoVista == 1
                ? _buildGridView()
                : tipoVista == 2
                    ? _buildAlumno()
                    : tipoVista == 3
                        ? _buildGridResponsables()
                        : tipoVista == 4
                            ? _buildResponsable()
                            : _buildResponsableRegistro());
  }

  Widget _buildSeleccion() {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                'Información',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 100),
              _buildCard('lib/images/estudiante.webp', widget.color1, 'Alumnos',
                  cambiarVista),
              SizedBox(height: 20),
              _buildCard('lib/images/responsable.webp', widget.color2,
                  'Responsables', cambiarVista3),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCard(String imagePath, Color backgroundColor, String text,
      VoidCallback? onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(38),
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(38),
        ),
        elevation: 5,
        child: Container(
          height: 210,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(38),
                child: Image.asset(
                  imagePath,
                  height: 210,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 210,
                decoration: BoxDecoration(
                  color: backgroundColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(38),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  imagePath,
                  height: 180,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 30,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlumno() {
    return Stack(
      children: [
        // Imagen de fondo ajustada para verse completa
        Positioned(
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/placeholder.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Contenedor con color y opacidad
        Positioned.fill(
          child: Container(
            color: widget.color2.withOpacity(0.7),
          ),
        ),
        // Contenido encima del fondo
        Positioned(
          top: -60,
          left: 0,
          right: 0,
          bottom: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Alumnos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              // Imagen de perfil con ícono de edición
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('lib/images/placeholder.webp'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Contenedor blanco con bordes redondeados y sombra
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(48),
              topRight: Radius.circular(48),
            ),
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20.0,
                    spreadRadius: 0,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 34),
                      child: Text(
                        'José Sánchez',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text(
                        'Alumno',
                        style: TextStyle(
                          color: widget.color2,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Información de contacto en dos columnas con diseño de icono sobre tarjeta
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GridView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Número de columnas
                          mainAxisSpacing:
                              15, // Espacio vertical entre elementos
                          crossAxisSpacing:
                              20, // Espacio horizontal entre elementos
                          childAspectRatio:
                              1, // Relación de aspecto de 1 para cuadrado
                        ),
                        children: [
                          _buildAlumnoCard(
                              Iconsax.cake, '02/05/2006', widget.color3),
                          _buildAlumnoCard(
                              Iconsax.teacher,
                              'Universidad Autónoma del Estado de México',
                              widget.color3),
                          _buildAlumnoCard(
                              Icons.group_outlined, '2° A', widget.color3),
                          _buildAlumnoCard(
                              Icons.apple, 'Maestro Juan Díaz', widget.color3),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 90,
          left: 20,
          child: FloatingActionButton(
            onPressed: () {
              // Acción que deseas realizar al presionar el botón
              cambiarVista();
            },
            backgroundColor: widget.color1,
            child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            shape: CircleBorder(), // Asegura que sea circular
          ),
        )
      ],
    );
  }

  Widget _buildAlumnoCard(IconData icon, String text, Color color) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // Tarjeta redondeada con información de contacto
        Container(
          height: 200,
          width: 200,
          margin: EdgeInsets.only(
              top: 30), // Espacio para el ícono encima de la tarjeta
          padding: EdgeInsets.only(top: 10, right: 5, left: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(255, 102, 102, 102),
                fontSize: 18,
              ),
            ),
          ),
        ),

        // Ícono en un contenedor circular sobre la tarjeta
        Positioned(
          top: 0,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridView() {
    // Colores para el contorno
    List<Color> borderColors = [widget.color1, widget.color2, widget.color3];

    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30), // Espacio para el encabezado
              Center(
                child: Text(
                  'Alumnos',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              SizedBox(height: 20), // Espacio entre el título y el GridView
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Dos columnas
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio:
                        0.65, // Ajusta para controlar el alto de cada tarjeta
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    // Alternar el color del borde
                    Color borderColor =
                        borderColors[index % borderColors.length];

                    return InkWell(
                      borderRadius: BorderRadius.circular(28),
                      onTap: () {
                        // Aquí puedes manejar el evento onPressed
                        _onCardTapped(index);
                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(items[index]['image']!),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      color:
                                          borderColor, // Color alternante para el borde
                                      width: 4,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      10), // Espacio entre la imagen y el texto
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items[index]['text1']!,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(height: 4),
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
        Positioned(
          bottom: 90,
          left: 20,
          child: FloatingActionButton(
            onPressed: () {
              // Acción que deseas realizar al presionar el botón
              cambiarVista6();
            },
            backgroundColor: widget.color1,
            child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            shape: CircleBorder(), // Asegura que sea circular
          ),
        )
      ],
    );
  }

  Widget _buildGridResponsables() {
    // Colores para el contorno
    List<Color> borderColors = [widget.color1, widget.color2, widget.color3];

    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30), // Espacio para el encabezado
              Center(
                child: Text(
                  'Responsables',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              SizedBox(height: 20), // Espacio entre el título y el GridView
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Dos columnas
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio:
                        0.65, // Ajusta para controlar el alto de cada tarjeta
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    // Alternar el color del borde
                    Color borderColor =
                        borderColors[index % borderColors.length];

                    return InkWell(
                      borderRadius: BorderRadius.circular(28),
                      onTap: () {
                        // Aquí puedes manejar el evento onPressed
                        _onCardTappedResponsable(index);
                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(items[index]['image']!),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      color:
                                          borderColor, // Color alternante para el borde
                                      width: 4,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      10), // Espacio entre la imagen y el texto
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items[index]['text1']!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(height: 4),
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
        // Botón flotante en la esquina inferior derecha
        Positioned(
          bottom: 90,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {
              // Acción que deseas realizar al presionar el botón
              cambiarVista5();
            },
            backgroundColor: widget.color2,
            child: Icon(Icons.add, color: Colors.white),
            shape: CircleBorder(), // Asegura que sea circular
          ),
        ),
        Positioned(
          bottom: 90,
          left: 20,
          child: FloatingActionButton(
            onPressed: () {
              // Acción que deseas realizar al presionar el botón
              cambiarVista6();
            },
            backgroundColor: widget.color1,
            child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            shape: CircleBorder(), // Asegura que sea circular
          ),
        )
      ],
    );
  }

  Widget _buildResponsable() {
    return Stack(
      children: [
        // Imagen de fondo ajustada para verse completa
        Positioned(
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/placeholder.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Contenedor con color y opacidad
        Positioned.fill(
          child: Container(
            color: widget.color3.withOpacity(0.7),
          ),
        ),
        // Contenido encima del fondo
        Positioned(
          top: -60,
          left: 0,
          right: 0,
          bottom: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Responsables',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              // Imagen de perfil con ícono de edición
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('lib/images/placeholder.webp'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Contenedor blanco con bordes redondeados y sombra
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(48),
              topRight: Radius.circular(48),
            ),
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20.0,
                    spreadRadius: 0,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 34),
                      child: Text(
                        'Anne Grethe',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text(
                        'Responsable',
                        style: TextStyle(
                          color: widget.color3,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Información de contacto en dos columnas con diseño de icono sobre tarjeta
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GridView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Número de columnas
                          mainAxisSpacing:
                              15, // Espacio vertical entre elementos
                          crossAxisSpacing:
                              20, // Espacio horizontal entre elementos
                          childAspectRatio:
                              1, // Relación de aspecto de 1 para cuadrado
                        ),
                        children: [
                          _buildAlumnoCard(
                              Iconsax.mobile, '7223023453', widget.color2),
                          _buildAlumnoCard(
                              Iconsax.tag_user, 'AnneTutor01', widget.color2),
                          _buildAlumnoCard(
                              Iconsax.password_check, '1234', widget.color2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 90,
          left: 20,
          child: FloatingActionButton(
            onPressed: () {
              // Acción que deseas realizar al presionar el botón
              cambiarVista3();
            },
            backgroundColor: widget.color1,
            child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            shape: CircleBorder(), // Asegura que sea circular
          ),
        )
      ],
    );
  }

Widget _buildResponsableRegistro() {
  return Stack(
    children: [
      // Imagen de fondo ajustada para verse completa
      Positioned(
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/placeholder.webp'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      // Contenedor con color y opacidad
      Positioned.fill(
        child: Container(
          color: widget.color3.withOpacity(0.7),
        ),
      ),
      // Contenido encima del fondo
      Positioned(
        top: -60,
        left: 0,
        right: 0,
        bottom: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Registro',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            // Imagen de perfil con ícono de edición
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('lib/images/placeholder.webp'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: widget.color2,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // Contenedor blanco con bordes redondeados y sombra
      Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(48),
            topRight: Radius.circular(48),
          ),
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20.0,
                  spreadRadius: 0,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 34),
                    child: Text(
                      'Responsable',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  // Campos de texto con icono circular
                  _buildTextFieldWithIcon(Icons.person, 'Nombre'),
                  _buildTextFieldWithIcon(Icons.phone, 'Teléfono', isNumeric: true),
                  _buildTextFieldWithIcon(Iconsax.user, 'Usuario'),
                  _buildTextFieldWithIcon(Iconsax.password_check, 'Contraseña', isPassword: true),
                  SizedBox(height: 10),

                  // Botón "Registrar" centrado con sombra
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 4.0,
                            offset: Offset(0, 6),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: widget.color1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          onPressed: () {
                            // Aquí va la acción del botón
                            cambiarVista3();
                          },
                          child: Text(
                            'Registrar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Espacio debajo del botón
                ],
              ),
            ),
          ),
        ),
      ),
      Positioned(
          top: 50,
          left: 20,
          child: FloatingActionButton(
            onPressed: () {
              // Acción que deseas realizar al presionar el botón
              cambiarVista3();
            },
            backgroundColor: widget.color1,
            child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            shape: CircleBorder(), // Asegura que sea circular
          ),
        )
    ],
  );
}


  Widget _buildTextFieldWithIcon(IconData icon, String hintText,
      {bool isPassword = false, bool isNumeric = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: widget.color2,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          SizedBox(width: 16),
          Expanded(
            child: TextField(
              obscureText: isPassword,
              keyboardType:
                  isNumeric ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                hintText: hintText,
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: widget.color3),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: widget.color3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: widget.color3, width: 2),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onCardTapped(int index) {
    // Aquí puedes manejar la lógica cuando se toca un card
    // Por ejemplo, puedes navegar a otra pantalla o actualizar el estado de la vista.
    // Dependiendo de tu implementación:
    cambiarVista2();
  }

  void _onCardTappedResponsable(int index) {
    // Aquí puedes manejar la lógica cuando se toca un card
    // Por ejemplo, puedes navegar a otra pantalla o actualizar el estado de la vista.
    // Dependiendo de tu implementación:
    cambiarVista4();
  }
}

// CustomClipper para crear una forma de ola (WaveClipperTwo)
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
