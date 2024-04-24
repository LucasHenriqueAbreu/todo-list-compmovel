import 'package:flutter/material.dart';

class RegiserTaskView extends StatelessWidget {
  final TextEditingController _editingController = TextEditingController();

  RegiserTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova tarefa'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: TextField(
                  controller: _editingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Informe sua tarefa',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop<String>(context, _editingController.text);
                },
                child: const Text('Salvar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
