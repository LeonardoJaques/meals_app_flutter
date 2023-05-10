import 'package:flutter/material.dart';
import 'package:meals_app_flutter/components/main_drawer.dart';
import 'package:meals_app_flutter/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  const SettingsScreen(this.onSettingsChanged, {super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

final settings = Settings();

class _SettingsScreenState extends State<SettingsScreen> {
  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChange,
  ) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
          onChange(value);
          widget.onSettingsChanged(settings);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Configurações',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Sem Glúten',
                  'Só exibe refeições sem glúten!',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose!',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeições veganas!',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas!',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
