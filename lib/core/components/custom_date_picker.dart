import 'package:flutter/material.dart';

import '../core.dart';

class CustomDatePicker extends StatefulWidget {
  final void Function(DateTime selectedDate)? onDateSelected;
  final DateTime? initialDate;
  final Widget? prefix;
  final String label;
  final bool showLabel;

  const CustomDatePicker({
    super.key,
    required this.label,
    this.showLabel = true,
    this.initialDate,
    this.onDateSelected,
    this.prefix,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late TextEditingController controller;
  late DateTime selectedDate;

  @override
  void initState() {
    controller = TextEditingController(
      text: widget.initialDate?.toFormattedDate(),
    );
    selectedDate = widget.initialDate ?? DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        controller.text = selectedDate.toFormattedDate();
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabel) ...[
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 4),
            child: Text(
              widget.label,
              style: SMFontPoppins.actionMedium14
                  .copyWith(color: SMColors.naturalGrey80),
            ),
          ),
        ],
        TextFormField(
          controller: controller,
          onTap: () => _selectDate(context),
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: SMColors.naturalGrey50),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: SMColors.naturalGrey50),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Assets.icons.calendar.svg(),
            ),
            hintText: 'Pilih tanggal',
            hintStyle: SMFontPoppins.paragraph1Reguler
                .copyWith(color: SMColors.naturalGrey50),
          ),
        ),
      ],
    );
  }
}
