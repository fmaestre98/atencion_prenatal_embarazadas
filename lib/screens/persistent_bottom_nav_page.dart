import 'package:atencion_prenatal_embarazadas/screens/add_page.dart';
import 'package:atencion_prenatal_embarazadas/screens/home_page.dart';
import 'package:atencion_prenatal_embarazadas/screens/search_page.dart';
import 'package:flutter/material.dart';

class PersistentBottomNavPage extends StatelessWidget {
  final _tab1navigatorKey = GlobalKey<NavigatorState>();
  final _tab2navigatorKey = GlobalKey<NavigatorState>();
  final _tab3navigatorKey = GlobalKey<NavigatorState>();

  PersistentBottomNavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentBottomBarScaffold(
      items: [
        PersistentTabItem(
          tab: HomePage(),
          icon: Icons.home,
          title: 'Home',
          navigatorkey: _tab1navigatorKey,
        ),
        PersistentTabItem(
          tab: SearchPage(),
          icon: Icons.search,
          title: 'Buscar',
          navigatorkey: _tab2navigatorKey,
        ),
        PersistentTabItem(
          tab: AddPage(),
          icon: Icons.add,
          title: 'Adicionar',
          navigatorkey: _tab3navigatorKey,
        ),
      ],
    );
  }
}


class PersistentBottomBarScaffold extends StatefulWidget {
  /// Lista de tabs y elementos del BottomNavigationBar
  final List<PersistentTabItem> items;

  const PersistentBottomBarScaffold({Key? key, required this.items})
      : super(key: key);

  @override
  State<PersistentBottomBarScaffold> createState() =>
      _PersistentBottomBarScaffoldState();
}

class _PersistentBottomBarScaffoldState
    extends State<PersistentBottomBarScaffold> {
  int _selectedTab = 0;
  void _resetNavigator(int index) {
    final navigatorKey = widget.items[index].navigatorkey;
    navigatorKey?.currentState?.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        /// Verificar si la pestaña actual puede hacer pop
        if (widget.items[_selectedTab].navigatorkey?.currentState?.canPop() ??
            false) {
          widget.items[_selectedTab].navigatorkey?.currentState?.pop();
          return false;
        } else {
          // Si la pestaña actual no puede hacer pop, usar el root navigator
          return true;
        }
      },
      child: Scaffold(
        /// Usar IndexedStack para mantener el orden y estado de las pestañas
        body: IndexedStack(
          index: _selectedTab,
          children: widget.items
              .map((page) => Navigator(
            /// Cada pestaña está envuelta en un Navigator para
            /// que la navegación dentro de cada pestaña sea independiente
            key: page.navigatorkey,
            onGenerateInitialRoutes: (navigator, initialRoute) {
              return [
                MaterialPageRoute(builder: (context) => page.tab)
              ];
            },
          ))
              .toList(),
        ),

        /// Definir la barra de navegación inferior persistente
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) {
            /// Restablecer el estado del Navigator para la nueva pestaña
            if (index != _selectedTab) {
              _resetNavigator(index); // Reiniciar la navegación
            }
            setState(() {
              _selectedTab = index;
            });// Llamar a la función provista por el padre
          },
          items: widget.items
              .map((item) => BottomNavigationBarItem(
              icon: Icon(item.icon), label: item.title))
              .toList(),
        ),
      ),
    );
  }
}

/// Model class that holds the tab info for the [PersistentBottomBarScaffold]
class PersistentTabItem {
  final Widget tab;
  final GlobalKey<NavigatorState>? navigatorkey;
  final String title;
  final IconData icon;

  PersistentTabItem(
      {required this.tab,
        this.navigatorkey,
        required this.title,
        required this.icon});
}