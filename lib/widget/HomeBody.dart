import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/them/ThemeCubit.dart';
import '../common_button/HomeButton.dart';
import '../common_button/HomeText.dart';
import '../common_button/LocalizationKeys.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const HomeText(),
        const SizedBox(height: 20),
        HomeButton(
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
          },
          buttonText: LocalizationKeys.toggleTheme,
        ),
        const SizedBox(height: 20),
        HomeButton(
          onPressed: () {
            context.read<LanguageCubit>().toggleLanguage();
          },
          buttonText: LocalizationKeys.toggleLanguage,
        ),
      ],
    );
  }
}