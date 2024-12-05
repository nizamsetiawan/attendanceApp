import 'package:flutter/material.dart';
import 'package:facedivi/data/datasources/auth_local_datasource.dart';
import 'package:facedivi/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';
import '../../home/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  bool isShowPassword = false;

  @override
  void initState() {
    emailController = TextEditingController( text: "nizamsetiawan15@gmail.com");
    passwordController = TextEditingController(text: "12345678");
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceHeight(100),
              Image.asset(
                Assets.images.logo.path,
                width: 150,
              ),
              const SpaceHeight(20),
              Text("Selamat Datang Kembali",
              style: SMFontPoppins.header3Medium),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'di ',
                      style: SMFontPoppins.header3Medium.copyWith(color: AppColors.black),
                    ),
                    TextSpan(
                      text: 'Face Divi',
                      style: SMFontPoppins.header3Medium.copyWith(color: SMColors.primary),
                    ),
                  ],
                ),
              ),
              Text("Silahkan masuk menggunakan email dan kata sandi anda",
                  style: SMFontPoppins.actionMedium12.copyWith(color: SMColors.naturalGrey70)),
              const SpaceHeight(30),
              SMInputField(
                controller: emailController,
                label: 'Alamat Email',
                prefixWidget: Padding(
                  padding: const EdgeInsets.all(SMDimens.size8),
                  child: SmSvgPicture.asset(
                    value: Assets.icons.email.path,
                   fit: BoxFit.contain,

                  ),
                ),
                isRequired: true,
              ),
              const SpaceHeight(20),
              SMInputField(
                controller: passwordController,
                label: 'Kata Sandi',
                prefixWidget: Padding(
                  padding: const EdgeInsets.all(SMDimens.size8),
                  child: SmSvgPicture.asset(
                    value: Assets.icons.password.path,
                    fit: BoxFit.contain,
                  ),
                ),
                isRequired: true,
                obscureText: !isShowPassword,
              ),

              const SpaceHeight(SMDimens.size40),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    success: (data) {
                      AuthLocalDatasource().saveAuthData(data);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: SMToastBar.success(message: "Berhasil Login" ),
                        backgroundColor: SMColors.white,
                      ));
                      context.pushReplacement(const MainPage());
                    },
                    error: (message) {
                      // SMToastBar.error(message: message);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: SMToastBar.error(message: message),
                        backgroundColor: SMColors.white,
                      ));

                    },
                  );
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return SizedBox(
                        width: double.infinity,
                        child: SMButtonFill.primaryMedium(
                          onPressed: () {
                            context.read<LoginBloc>().add(
                              LoginEvent.login(
                                emailController.text,
                                passwordController.text,
                              ),
                            );
                          },
                          text: 'Masuk',
                        ),
                      );

                    },
                    loading: () {
                      return const Center(
                        child: SMCircularLoading(
                          isBasicLoading: true,
                        )
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
