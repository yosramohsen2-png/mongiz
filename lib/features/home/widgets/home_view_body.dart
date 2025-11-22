import 'package:flutter/material.dart';
import 'package:mongiz/core/utils/assets.dart';
import 'package:mongiz/features/azkark/presentation/views/azkark_view.dart';
import 'package:mongiz/features/challenge/presentation/views/challenge_view.dart';
import 'package:mongiz/features/home/widgets/custom_app_bar.dart';
import 'package:mongiz/features/home/widgets/custom_home_container.dart';
import 'package:mongiz/features/home/widgets/reserve_container.dart';
import 'package:mongiz/features/note/presentation/views/note_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsData.backGround,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAppBar(
                centerWidget: Image.asset(AssetsData.logoSmall),
                showIcon: false,
              ),
              const SizedBox(height: 100),
              CustomHomeContainer(
                title: 'نوت منجز',
                iconPath: AssetsData.note,
                onTap: () =>
                    Navigator.of(context).pushNamed(NoteView.routeName),
              ),
              const SizedBox(height: 10),
              ReserveContainer(
                title: 'تحدى جديد',
                iconPath: AssetsData.challenge,
                onTap: () =>
                    Navigator.of(context).pushNamed(ChallengeView.routeName),
              ),
              const SizedBox(height: 10),
              CustomHomeContainer(
                title: 'فعل أذكارك',
                iconPath: AssetsData.azkark,
                onTap: () =>
                    Navigator.of(context).pushNamed(AzkarkView.routeName),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
