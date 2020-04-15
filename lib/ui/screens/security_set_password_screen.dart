import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mooncake/ui/ui.dart';

/// Represents the screen that is shown to the user when he needs to set
/// the password to protect his account.
class SetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(PostsLocalizations.of(context).passwordTitle),
      ),
      backgroundColor: Colors.white,
      body: BlocProvider<SetPasswordBloc>(
        create: (context) => SetPasswordBloc.create(context),
        child: BlocBuilder<SetPasswordBloc, SetPasswordState>(
          builder: (context, state) {
            return SafeArea(
              child: Stack(
                children: <Widget>[
                  SetPasswordContent(),
                  if (state.savingPassword)
                    GenericPopup(
                      backgroundColor: Colors.white.withOpacity(0.5),
                      content: SavingPasswordPopupContent(),
                    )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}