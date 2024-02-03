import 'package:dreambiztech/ui/multiple_Selection_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../AppLocalizations.dart';
import '../bloc/them/ThemeCubit.dart';
import '../common_button/LocalizationKeys.dart';

import 'HomeBody.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations(context.read<LanguageCubit>().state.locale)
            .translate(LocalizationKeys.title)),
      ),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MultipleSelectionScreen()),
          );
        },
        child: Icon(Icons.add),
      ),

    );
  }
}