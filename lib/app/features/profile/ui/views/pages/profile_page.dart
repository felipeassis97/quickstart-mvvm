import 'package:flutter/material.dart';
import 'package:quickstart_mvvm/app/shared/theme/app_theme/switch_theme_mode.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late bool value;

  @override
  Widget build(BuildContext context) {
    Theme.of(context).brightness == Brightness.dark
        ? value = true
        : value = false;

    final thumbIcon = MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(
            Icons.dark_mode_rounded,
          );
        }
        return const Icon(
          Icons.light_mode_rounded,
        );
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(
                      'THEME MODE',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ),
                  Switch(
                      inactiveThumbColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      thumbIcon: thumbIcon,
                      value: value,
                      onChanged: (val) {
                        setState(() {
                          value = val;
                          if (value) {
                            SwitchThemeMode.toggleTheme(ThemeMode.dark);
                          } else {
                            SwitchThemeMode.toggleTheme(ThemeMode.light);
                          }
                        });
                      }),
                ],
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Elevated Button')),
              const SizedBox(height: 4),
              ElevatedButton.icon(
                  icon: Icon(Icons.close),
                  onPressed: () {},
                  label: const Text('Elevated Button Icon')),
              const SizedBox(height: 8),
              OutlinedButton(
                  onPressed: () {}, child: const Text('Outlined Button')),
              const SizedBox(height: 4),
              OutlinedButton.icon(
                  icon: Icon(Icons.close),
                  onPressed: () {},
                  label: const Text('Outlined Button Icon')),
              const SizedBox(height: 8),
              TextButton(onPressed: () {}, child: const Text('Text Button')),
              const SizedBox(height: 4),
              TextButton.icon(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    _showDialog(context);
                  },
                  label: const Text('Text Button Icon')),
              const SizedBox(height: 8),
              TextField(decoration: InputDecoration(label: Text('Teste')))
            ],
          ),
        ));
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exemplo de Diálogo'),
          content: Text('Este é um diálogo de exemplo.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
