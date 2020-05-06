import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mooncake/ui/ui.dart';

import 'common.dart';

/// Represents the editor that allows to change the poll end date.
class PollEndDateEditor extends StatelessWidget {
  final formatter = DateFormat.yMd().add_Hm();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostInputBloc, PostInputState>(
      builder: (context, state) {
        return Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () => _showDatePicker(context, state),
            child: Container(
              decoration: getInputDecoration(context),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      PostsLocalizations.of(context).pollEndDateText,
                      style: Theme.of(context).inputDecorationTheme.hintStyle,
                    ),
                  ),
                  Text(formatter.format(state.poll.endDate)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showDatePicker(BuildContext context, PostInputState state) async {
    final currentDate = state.poll.endDate;

    // Ask for a date
    final date = await showDatePicker(
      context: context,
      useRootNavigator: false,
      firstDate: DateTime(1900),
      initialDate: currentDate ?? DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      // Ask for a time
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(currentDate ?? DateTime.now()),
      );

      // Update the date
      final newDate = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
      BlocProvider.of<PostInputBloc>(context).add(ChangePollDate(newDate));
    }
  }
}
