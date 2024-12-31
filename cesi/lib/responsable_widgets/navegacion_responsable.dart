import 'package:cesi/responsable_widgets/home_responsable.dart';
import 'package:cesi/responsable_widgets/seleccionar_informacion_responsable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cesi/responsable_widgets/responsable_perfil.dart';

class NavegacionMenuResponsable extends StatelessWidget {
  final Color color1; // Primer color del degradado
  final Color color2; // Segundo color del degradado
  final Color color3; // Color de icono no seleccionado

  const NavegacionMenuResponsable({
    super.key,
    required this.color1,
    required this.color2,
    required this.color3,
  });

  @override
  Widget build(BuildContext context) {
    // Pasamos los colores a NavigationController
    final controller = Get.put(NavigationControllerR(color1, color2, color3), permanent: true);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Obx(
        () => Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: SafeArea(
            child: SizedBox(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Iconsax.home, 0, controller),
                  _buildNavItem(Iconsax.user, 1, controller),
                  _buildNavItem(Iconsax.user_search, 2, controller),
                  //_buildNavItem(Iconsax.notification, 3, controller),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  Widget _buildNavItem(IconData icon, int index, NavigationControllerR controller) {
    final isSelected = controller.selectedIndex.value == index;

    return GestureDetector(
      onTap: () {
        controller.selectedIndex.value = index;
      },
      child: AnimatedScale(
        scale: isSelected ? 1.2 : 1.0,
        duration: Duration(milliseconds: 300),
        child: MouseRegion(
          onEnter: (_) => _showOpacityEffect(index, controller),
          onExit: (_) => _hideOpacityEffect(index, controller),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.white : Colors.transparent,
            ),
            padding: EdgeInsets.all(8),
            child: Opacity(
              opacity: isSelected ? 1.0 : 0.8,
              child: Icon(
                icon,
                color: isSelected ? color1 : Color.fromARGB(139, 255, 255, 255),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showOpacityEffect(int index, NavigationControllerR controller) {
    controller.selectedIndex.value = index;
  }

  void _hideOpacityEffect(int index, NavigationControllerR controller) {}

}

class NavigationControllerR extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final Color color1;
  final Color color2;
  final Color color3;

  NavigationControllerR(this.color1, this.color2, this.color3);

  // Aquí instanciamos las pantallas pasando los colores a TutorPerfil
  late final screens = [
    HomeResponsable(color1: color1, color2: color2, color3: color3),
    ResponsablePerfil(color1: color1, color2: color2, color3: color3),
    InformacionSeleccionResponsable(color1: color1, color2: color2, color3: color3),
    //NotificacionesTutor(color1: color1, color2: color2, color3: color3),
  ];
}

