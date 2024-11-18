import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Destination{
  final String label;
  final IconData icon;

  const Destination({required this.label, required this.icon});
}

const destinations = [
  Destination(label: "Home", icon: Icons.home),
  Destination(label: "Buscar", icon: Icons.search),
  Destination(label: "Adicionar", icon: Icons.add),
];