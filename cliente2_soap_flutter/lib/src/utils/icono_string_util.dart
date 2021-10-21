import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'Adicionar': Icons.add,
  'Eliminar': Icons.delete,
  'Actualizar': Icons.update,
  'Listar': Icons.list,
  'Consultar': Icons.search_outlined,
  'Gráfico': Icons.auto_graph_outlined,
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.blue);
}
