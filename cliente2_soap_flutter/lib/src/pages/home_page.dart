import 'package:cliente2_soap_flutter/src/pages/adicionar_participante.dart';
import 'package:cliente2_soap_flutter/src/providers/menu_provider.dart';
import 'package:cliente2_soap_flutter/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle = TextStyle(fontSize: 24);
  static List<Widget> _widgetOptions = <Widget>[
    Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Desarrollado por: Luis y sus amiguitos :3',
            style: optionStyle,
          ),
        ],
      ),
    ),
    Participante(optionStyle: optionStyle),
    Partido(optionStyle: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Universidad'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            _widgetOptions.elementAt(_selectedIndex),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Participante',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Partido',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _listaParticipante() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          shrinkWrap: true,
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue.shade600),
        onTap: () {
          /* final route = MaterialPageRoute(builder: (context) => AlertPage());
          Navigator.push(context, route);*/

          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      opciones
        ..add(widgetTemp)
        ..add(Divider());
    });

    return opciones;
  }

  Widget _listaPartido() {
    return FutureBuilder(
      future: menuProvider2.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          shrinkWrap: true,
          children: _listaItemsp(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItemsp(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue.shade600),
        onTap: () {
          /* final route = MaterialPageRoute(builder: (context) => AlertPage());
          Navigator.push(context, route);*/

          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      opciones
        ..add(widgetTemp)
        ..add(Divider());
    });

    return opciones;
  }
}

class Participante extends StatelessWidget {
  const Participante({
    Key key,
    @required this.optionStyle,
  }) : super(key: key);

  final TextStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '',
          style: optionStyle,
        ),
        SizedBox(
          height: 500,
          child: _HomePageState()._listaParticipante(),
        )
      ],
    );
  }
}

class Partido extends StatelessWidget {
  const Partido({
    Key key,
    @required this.optionStyle,
  }) : super(key: key);

  final TextStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '',
          style: optionStyle,
        ),
        SizedBox(
          height: 500,
          child: _HomePageState()._listaPartido(),
        )
      ],
    );
  }
}
