import 'package:facedivi/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/add_notes/add_notes_bloc.dart';
import 'main_page.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late final TextEditingController titleController;
  late final TextEditingController noteController;

  @override
  void initState() {
    titleController = TextEditingController();
    noteController = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Catatan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              SMInputField(
                controller: titleController,
                label: "Judul Catatan",
                textHint: "Isi judul catatan",
              ),
              const SpaceHeight(26.0),
              SMInputField(
                controller: noteController,
                label: "Catatan",
                textHint: "Isi Catatan",
                maxLines: 5,
              ),
              const SpaceHeight(36.0),
              BlocConsumer<AddNotesBloc, AddNotesState>(
                listener: (context, state) {
                 state.maybeWhen(
                     orElse: (){},
                   error: (message){
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                       content: SMToastBar.error(message: message ),
                       backgroundColor: SMColors.white,
                     ));
                   },
                   success: (){
                       titleController.clear();
                       noteController.clear();
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                         content: SMToastBar.success(message: "Penambahan Catatan Berhasil" ),
                         backgroundColor: SMColors.white,
                       ));
                       context.pushReplacement(const MainPage());
                   }
                 );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                      orElse: () {
                    return SizedBox(
                      width: double.infinity,
                      child: SMButtonFill.primaryMedium(
                        text: "Tambahkan",
                        onPressed: () {
                          context.read<AddNotesBloc>().add(
                              AddNotesEvent.addNotes(title: titleController.text, note: noteController.text)
                          );

                        },
                      ),
                    );
                  },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    )
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
