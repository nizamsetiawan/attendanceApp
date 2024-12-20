import 'package:flutter/material.dart';
import 'package:facedivi/presentation/home/bloc/get_attendance_by_date/get_attendance_by_date_bloc.dart';
import 'package:facedivi/presentation/home/widgets/history_attendace.dart';
import 'package:facedivi/presentation/home/widgets/history_location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:calendar_timeline_sbk/calendar_timeline.dart';

import '../../../core/core.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    //current date format yyyy-MM-dd used intl package
    final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    //get attendance by date
    context
        .read<GetAttendanceByDateBloc>()
        .add(GetAttendanceByDateEvent.getAttendanceByDate(currentDate));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Absensi'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18.0),
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime(2019, 1, 15),
            lastDate: DateTime.now().add(const Duration(days: 7)),
            onDateSelected: (date) {
              final selectedDate = DateFormat('yyyy-MM-dd').format(date);

              context.read<GetAttendanceByDateBloc>().add(
                    GetAttendanceByDateEvent.getAttendanceByDate(selectedDate),
                  );
            },
            leftMargin: 20,
            monthColor: AppColors.grey,
            dayColor: AppColors.black,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: AppColors.primary,
            showYears: true,
          ),
          const SpaceHeight(45.0),
          BlocBuilder<GetAttendanceByDateBloc, GetAttendanceByDateState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const SizedBox.shrink();
                },
                error: (message) {
                  return Center(
                    child: SMErrorWidget(message: message),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                empty: () {
                  return const Center(
                      child: SMDataNotFound(message: 'No Data Found'));
                },
                loaded: (attendance) {
                  // Ambil data pertama dari list (atau ubah logika sesuai kebutuhan)
                  // final attendance = attendanceList.first;

                  // Pisahkan latlongIn menjadi latitude dan longitude
                  final latlongInParts = attendance.latlonIn!.split(',');
                  final latitudeIn = double.tryParse(latlongInParts.first);
                  final longitudeIn = double.tryParse(latlongInParts.last);

                  final latlongOutParts = attendance.latlonOut!.split(',');
                  final latitudeOut = double.tryParse(latlongOutParts.first);
                  final longitudeOut = double.tryParse(latlongOutParts.last);

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HistoryAttendance(
                        statusAbsen: 'Datang',
                        time: attendance.timeIn ?? '',
                        date: attendance.date.toString(),
                      ),
                      const SpaceHeight(10.0),
                      HistoryLocation(
                        latitude: latitudeIn!,
                        longitude: longitudeIn!,
                      ),
                      const SpaceHeight(25),
                      HistoryAttendance(
                        statusAbsen: 'Pulang',
                        isAttendanceIn: false,
                        time: attendance.timeOut ?? '',
                        date: attendance.date.toString(),
                      ),
                      const SpaceHeight(10.0),
                      HistoryLocation(
                        isAttendance: false,
                        latitude: latitudeOut!,
                        longitude: longitudeOut!,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
