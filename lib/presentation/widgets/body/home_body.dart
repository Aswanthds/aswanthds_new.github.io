import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/config/extensions.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/widgets/fade_in_up.dart';

import '../../blocs/home_bloc/home_bloc.dart';
import '../app_bar/vertical_headers_builder.dart';
import 'about_me/about_me_section.dart';
import 'contact/contact_section.dart';
import 'experience/experience_section.dart';
import 'intro/intro_section.dart';
import 'projects/projects_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ScrollController _controller = ScrollController();
  final introKey = GlobalKey();
  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initListenerForInteractWithHeaderIndex();
    });
  }

  void _initListenerForInteractWithHeaderIndex() {
    _controller.addListener(() {
      if (introKey.currentContext == null ||
          aboutKey.currentContext == null ||
          experienceKey.currentContext == null ||
          projectKey.currentContext == null) {
        return;
      }

      double introHeight = introKey.currentContext!.size!.height;
      double aboutHeight = aboutKey.currentContext!.size!.height;
      double experienceHeight = experienceKey.currentContext!.size!.height;
      double projectHeight = projectKey.currentContext!.size!.height;

      double controllerHeight = _controller.offset;

      if (_controller.position.extentAfter == 0.0) {
        context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(4));
      } else if (controllerHeight < introHeight) {
        context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(0));
      } else if (controllerHeight < (introHeight + aboutHeight)) {
        context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(1));
      } else if (controllerHeight <
          (introHeight + aboutHeight + experienceHeight)) {
        context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(2));
      } else if (controllerHeight <
          (introHeight + aboutHeight + experienceHeight + projectHeight)) {
        context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(3));
      } else {
        context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(4));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is AppBarHeadersIndexChanged) {
          Navigator.of(context).maybePop();
          const duration = Duration(milliseconds: 500);
          const curve = Curves.easeInOut;

          GlobalKey? targetKey;
          switch (state.index) {
            case 0:
              targetKey = introKey;
              break;
            case 1:
              targetKey = aboutKey;
              break;
            case 2:
              targetKey = experienceKey;
              break;
            case 3:
              targetKey = projectKey;
              break;
            case 4:
              targetKey = contactKey;
              break;
          }

          if (targetKey != null && targetKey.currentContext != null) {
            Scrollable.ensureVisible(
              targetKey.currentContext!,
              duration: duration,
              curve: curve,
              alignment: 0.0, // Scroll to the very top of the section
            );
          }
        }
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.appBarColor,
                  AppColors.darkColor,
                ],
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.mediaQueryWidth * .08,
            ),
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: IntroSection(key: introKey),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: AboutMeSection(key: aboutKey),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: ExperienceSection(key: experienceKey),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: ProjectsSection(key: projectKey),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: ContactSection(key: contactKey),
                  ),
                ],
              ),
            ),
          ),
          const VerticalHeadersBuilder(),
          // Scroll Progress Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double progress = 0.0;
                if (_controller.hasClients &&
                    _controller.position.maxScrollExtent > 0) {
                  progress =
                      _controller.offset / _controller.position.maxScrollExtent;
                }
                return Container(
                  height: 3,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: progress.clamp(0.0, 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryColor,
                            AppColors.accentColor,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryColor.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
