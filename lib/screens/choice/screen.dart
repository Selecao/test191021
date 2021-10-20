import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test191021/resources/app_color.dart';
import 'package:test191021/resources/app_text_theme.dart';
import 'package:test191021/resources/icons.dart';
import 'package:test191021/screens/root/bloc/navigation_bloc.dart';

class ChoiceScreen extends StatelessWidget {
  const ChoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          const _Background(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 4),
              ChoiceButton(
                title: 'Track my period',
                subtitle: 'contraception and wellbeing',
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context).add(
                    PressedOnPageA(text: 'Track my period'),
                  );
                },
              ),
              const SizedBox(height: 73.0),
              ChoiceButton(
                title: 'Get pregnant',
                subtitle: 'learn about reproductive health',
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context).add(
                    PressedOnPageA(text: 'Get pregnant'),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const ChoiceButton({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 34, right: 37),
        padding: const EdgeInsets.fromLTRB(12.0, 31.0, 17.0, 31.0),
        decoration: BoxDecoration(
          color: AppColors.beigePink,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextTheme.headline5,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 6.0),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              subtitle,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              AppIcons.arrowForward,
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SvgPicture.asset(
            AppIcons.screen1top,
            width: MediaQuery.of(context).size.width / 2,
            alignment: Alignment.centerLeft,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 67.0),
                      SvgPicture.asset(
                        AppIcons.screen1mid,
                        width: MediaQuery.of(context).size.width / 2.7,
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width / 2.7),
                ],
              ),
              SvgPicture.asset(
                AppIcons.screen1bottom,
                width: MediaQuery.of(context).size.width / 5.5,
                alignment: Alignment.bottomRight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
