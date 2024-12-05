import 'package:flutter/material.dart';

import 'package:facedivi/data/models/response/auth_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/components/image_picker_widget.dart';
import '../../../core/core.dart';
import '../../../data/datasources/auth_local_datasource.dart';
import '../../../data/models/request/user_request_model.dart';
import '../bloc/get_user/get_user_bloc.dart';
import '../bloc/update_user/update_user_bloc.dart';

class UpdateProfilePage extends StatefulWidget {
  final User user;

  const UpdateProfilePage({
    super.key,
    required this.user,
  });

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  XFile? imageFile;
  AuthResponseModel? authData;

  @override
  void initState() {
    super.initState();
    loadData();
    nameController = TextEditingController(text: widget.user.name ?? '');
    emailController = TextEditingController(text: widget.user.email ?? '');
    phoneController = TextEditingController(text: widget.user.phone ?? '');
  }

  loadData() async {
    authData = await AuthLocalDatasource().getAuthData();
    setState(() {});
  }

  @override
  void dispose() {
    nameController?.dispose();
    emailController?.dispose();
    phoneController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ubah Data Profile",
          ),
          actions: const [],
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              height: 52,
              child: BlocConsumer<UpdateUserBloc, UpdateUserState>(
                listener: (context, state) {
                  state.maybeMap(
                    orElse: () {},
                    success: (user) async {
                      context
                          .read<GetUserBloc>()
                          .add(const GetUserEvent.getUser());

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            SMToastBar.success(message: "Ubah Data Berhasil"),
                        backgroundColor: SMColors.white,
                      ));
                      context.pop(true);
                    },
                    error: (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: SMToastBar.error(message: "Ubah Data Gagal"),
                        backgroundColor: SMColors.white,
                      ));
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return Button.filled(
                        onPressed: () {
                          final String name = nameController!.text;
                          final String email = emailController!.text;
                          final String phone = phoneController!.text;
                          final UserRequestModel user = UserRequestModel(
                            id: widget.user.id!,
                            name: name,
                            email: email,
                            phone: phone,
                            image: imageFile,
                          );
                          context.read<UpdateUserBloc>().add(
                              UpdateUserEvent.updateUser(
                                  user, widget.user.id!));
                        },
                        label: 'Simpan',
                      );
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                },
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              SMInputField(
                label: 'Nama',
                controller: nameController!,
              ),
              SpaceHeight(16),
              SMInputField(
                label: 'Email',
                controller: emailController!,
              ),
              SpaceHeight(16),
              SMInputField(
                label: 'No Handphone',
                controller: phoneController!,
              ),
              SpaceHeight(16),
              ImagePickerWidget(
                label: 'Foto Profil',
                onChanged: (file) {
                  if (file == null) {
                    return;
                  }
                  imageFile = file;
                },
                imageUrl: widget.user.imageUrl,
              ),
            ],
          ),
        ));
  }
}
