import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test191021/resources/app_color.dart';
import 'package:test191021/resources/app_text_theme.dart';
import 'package:test191021/resources/constants.dart';
import 'package:test191021/resources/icons.dart';
import 'package:test191021/screens/root/bloc/navigation_bloc.dart';

class DateOfBirthScreen extends StatelessWidget {
  const DateOfBirthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? dateOfBirth;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          const _Background(),
          _Body(
            onTap: () {
              if (dateOfBirth != null) {
                BlocProvider.of<NavigationBloc>(context).add(
                  PressedOnPageB(
                    number: Constants.birthYears[dateOfBirth ?? 0],
                  ),
                );
              }
            },
            onSelectedItemChanged: (index) {
              dateOfBirth = index;
            },
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final VoidCallback onTap;
  final Function(int index)? onSelectedItemChanged;
  const _Body({
    Key? key,
    required this.onTap,
    required this.onSelectedItemChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height / 5),
          const Center(
            child: Text(
              'Log in your date of birth',
              style: AppTextTheme.headline5,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60.0),
          _AppPicker(onSelectedItemChanged: onSelectedItemChanged),
          const Spacer(),
          _Button(onTap: onTap),
          const SizedBox(height: 81.0),
        ],
      ),
    );
  }
}

class _AppPicker extends StatelessWidget {
  final Function(int index)? onSelectedItemChanged;

  const _AppPicker({
    Key? key,
    required this.onSelectedItemChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 288,
      child: CupertinoPicker(
        diameterRatio: 2,
        itemExtent: 67.0,
        onSelectedItemChanged: onSelectedItemChanged,
        squeeze: 1,
        scrollController: FixedExtentScrollController(initialItem: 35),
        selectionOverlay: Container(
          margin: const EdgeInsets.only(left: 31.0, right: 28.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            backgroundBlendMode: BlendMode.multiply,
            color: AppColors.grey200alpha50,
          ),
        ),
        children: List<Widget>.generate(
          Constants.birthYears.length,
          (index) => Center(
            child: Text(
              Constants.birthYears[index].toString(),
              style: AppTextTheme.headline3,
            ),
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final VoidCallback onTap;

  const _Button({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: 189.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: AppColors.violetGradient,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Text(
                'Next',
                style: AppTextTheme.headline6.copyWith(color: AppColors.white),
                textAlign: TextAlign.right,
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: SvgPicture.asset(
                  AppIcons.arrowForward,
                  color: AppColors.white,
                  width: 27,
                  alignment: Alignment.centerRight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AppIcons.screen2top1,
                    width: MediaQuery.of(context).size.width / 2.1,
                    alignment: Alignment.topCenter,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  const SizedBox(height: 28.0),
                  SvgPicture.asset(
                    AppIcons.screen2top2,
                    width: MediaQuery.of(context).size.width / 5.6,
                    alignment: Alignment.bottomCenter,
                  ),
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 5.6),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 28.0),
                      SvgPicture.asset(
                        AppIcons.screen2bottom1,
                        width: MediaQuery.of(context).size.width / 5.6,
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width / 5.6),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    AppIcons.screen2mid1,
                    width: MediaQuery.of(context).size.width / 18,
                    alignment: Alignment.bottomRight,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width / 3),
                  SvgPicture.asset(
                    AppIcons.screen2bottom2,
                    width: MediaQuery.of(context).size.width / 2.6,
                    alignment: Alignment.bottomRight,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
