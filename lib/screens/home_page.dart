import 'package:flutter/material.dart';
import 'package:modul_3/components/note_card.dart';
import 'package:modul_3/providers/note_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final noteState = context.watch<NoteProvider>();
    final noteList = noteState.noteList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Note App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addNote');
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<NoteProvider>(
          builder: (context, value, child) {
            // TODO 4 : Make a gridview using GridView.builder to populate the body with datas, but if the noteList is still empty render a centered text of "No Notes Added Yet!". Try using components provided in components folder to populate the GridView.builder//
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: noteList.length,
              itemBuilder: (context, index) => NoteCard(
                note: value.noteList[index].note,
                title: value.noteList[index].title,
                description: value.noteList[index].description,
              ),
            );
          },
        ),
      ),
    );
  }
}
