import 'package:facedivi/data/datasources/notes_remote_datasource.dart';
import 'package:facedivi/presentation/home/bloc/add_notes/add_notes_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:facedivi/data/datasources/attendance_remote_datasource.dart';
import 'package:facedivi/data/datasources/auth_remote_datasource.dart';
import 'package:facedivi/data/datasources/firebase_messanging_remote_datasource.dart';
import 'package:facedivi/data/datasources/permisson_remote_datasource.dart';
import 'package:facedivi/data/models/response/auth_response_model.dart';
import 'package:facedivi/data/models/response/qr_absen_remote_datasource.dart';
import 'package:facedivi/firebase_options.dart';
import 'package:facedivi/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:facedivi/presentation/home/bloc/add_permission/add_permission_bloc.dart';
import 'package:facedivi/presentation/home/bloc/check_qr/check_qr_bloc.dart';
import 'package:facedivi/presentation/home/bloc/checkin_attendance/checkin_attendance_bloc.dart';
import 'package:facedivi/presentation/home/bloc/checkout_attendance/checkout_attendance_bloc.dart';
import 'package:facedivi/presentation/home/bloc/get_attendance_by_date/get_attendance_by_date_bloc.dart';
import 'package:facedivi/presentation/home/bloc/get_company/get_company_bloc.dart';
import 'package:facedivi/presentation/home/bloc/get_qrcode_checkin/get_qrcode_checkin_bloc.dart';
import 'package:facedivi/presentation/home/bloc/get_qrcode_checkout/get_qrcode_checkout_bloc.dart';
import 'package:facedivi/presentation/home/bloc/is_checkedin/is_checkedin_bloc.dart';
import 'package:facedivi/presentation/home/bloc/update_user_register_face/update_user_register_face_bloc.dart';
import 'package:facedivi/presentation/profile/bloc/get_user/get_user_bloc.dart';
import 'package:facedivi/presentation/profile/bloc/update_user/update_user_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/core.dart';
import 'data/datasources/user_remote_datasource.dart';
import 'presentation/auth/bloc/login/login_bloc.dart';
import 'presentation/auth/pages/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessangingRemoteDatasource().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              UpdateUserRegisterFaceBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetCompanyBloc(AttendanceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => IsCheckedinBloc(AttendanceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              CheckinAttendanceBloc(AttendanceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              CheckoutAttendanceBloc(AttendanceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddPermissionBloc(PermissonRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              GetAttendanceByDateBloc(AttendanceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CheckQrBloc(QrAbsenRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetQrcodeCheckinBloc(),
        ),
        BlocProvider(
          create: (context) => GetQrcodeCheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => GetUserBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => UpdateUserBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddNotesBloc(NotesRemoteDatasource()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          dividerTheme:
              DividerThemeData(color: AppColors.light.withOpacity(0.5)),
          dialogTheme: const DialogTheme(elevation: 0),
          scaffoldBackgroundColor: SMColors.white,
          fontFamily: GoogleFonts.poppins().fontFamily,
          appBarTheme: AppBarTheme(
            color: SMColors.primary,
            centerTitle: true,
            elevation: 0,
            titleTextStyle:
                GoogleFonts.poppins(textStyle: SMFontPoppins.actionMedium14),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
        ),
        home: const SplashPage(),
      ),
    );
  }
}
