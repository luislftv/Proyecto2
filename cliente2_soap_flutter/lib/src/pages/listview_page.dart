import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent)
        //_agregar10();
        fetchData();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: [_crearLista(), _crearLoading()],
        ));
  }

  Widget _crearLista() {
    return RefreshIndicator(
        onRefresh: obtenerPagina1,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _listaNumeros.length,
          itemBuilder: (BuildContext context, int index) {
            final imagen = _listaNumeros[index];

            return FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/200/300?random=$index'));
          },
        ));
  }

  Future<Null> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 600,
        duration: Duration(milliseconds: 700), curve: Curves.fastOutSlowIn);
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()],
            ),
            SizedBox(
              height: 15.0,
            )
          ]);
    } else {
      return Container();
    }
  }
}