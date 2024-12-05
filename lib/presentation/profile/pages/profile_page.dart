import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/constants/variables.dart';
import '../../../core/core.dart';
import '../../auth/bloc/logout/logout_bloc.dart';
import '../../auth/pages/login_page.dart';
import '../bloc/get_user/get_user_bloc.dart';
import 'update_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<GetUserBloc>().add(const GetUserEvent.getUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<GetUserBloc, GetUserState>(
                builder: (context, state) {
                  return state.maybeWhen(orElse: () {
                    return SizedBox.shrink();
                  }, loading: () {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }, success: (user) {
                    return ListView(
                      children: [
                        user.imageUrl != null
                            ? CircleAvatar(
                                radius: 80,
                                backgroundImage: NetworkImage(
                                    "${Variables.baseUrl}/storage/${user.imageUrl}"),
                              )
                            : CircleAvatar(
                                radius: 80,
                                backgroundImage:
                                    AssetImage(Assets.icons.image.path),
                              ),
                        SpaceHeight(24),
                        SMInputField(
                          label: 'Nama',
                          controller: TextEditingController(text: user.name),
                          isEnable: false,
                        ),
                        SpaceHeight(16),
                        SMInputField(
                          label: 'Email',
                          controller: TextEditingController(text: user.email),
                          isEnable: false,
                        ),
                        SpaceHeight(16),
                        SMInputField(
                          label: 'No Handphone',
                          controller:
                              TextEditingController(text: user.phone ?? '-'),
                          isEnable: false,
                        ),
                        SpaceHeight(16),
                        SMInputField(
                          label: 'Peran',
                          controller: TextEditingController(text: user.role),
                          isEnable: false,
                        ),
                        SpaceHeight(16),
                        SMInputField(
                          label: 'Posisi',
                          controller:
                              TextEditingController(text: user.position),
                          isEnable: false,
                        ),
                        SpaceHeight(16),
                        SMInputField(
                          label: 'Departemen',
                          controller:
                              TextEditingController(text: user.department),
                          isEnable: false,
                        ),
                        SpaceHeight(24),
                        // SMButtonFill.secondaryMedium(
                        //   onPressed: () {
                        //     context.push(UpdateProfilePage(user: user));
                        //   },
                        //   text: 'Update Profile',
                        // ),
                        // SpaceHeight(16),
                      ],
                    );
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: BlocBuilder<GetUserBloc, GetUserState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => SizedBox.shrink(),
                        success: (user) {
                          return SMButtonOutline.primaryMedium(
                            onPressed: () {
                              context.push(UpdateProfilePage(user: user));
                            },
                            text: 'Ubah Data',
                          );
                        },
                      );
                    },
                  ),
                ),
                SpaceWidth(SMDimens.size12),
                Expanded(
                  child: BlocConsumer<LogoutBloc, LogoutState>(
                    listener: (context, state) {
                      state.maybeMap(
                        orElse: () {},
                        success: (_) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                SMToastBar.success(message: "Berhasil Keluar"),
                            backgroundColor: SMColors.white,
                          ));
                          context.pushReplacement(const LoginPage());
                        },
                        error: (value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(value.error),
                              backgroundColor: AppColors.red,
                            ),
                          );
                        },
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return SizedBox(
                            width: 120,
                            child: SMButtonFill.primaryMedium(
                              onPressed: () {
                                context
                                    .read<LogoutBloc>()
                                    .add(const LogoutEvent.logout());
                              },
                              text: 'Keluar',
                            ),
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
