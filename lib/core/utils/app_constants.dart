import 'package:portfolio/core/utils/app_assets.dart';

import '../../data/models/custom_service.dart';
import '../../data/models/experience.dart';
import '../../data/models/project.dart';

abstract class AppConstants {
  static const double appBarHeight = 80;
  static const List<Experience> experiences = [
    Experience(
      company: 'Cure and Care Primary Care Pvt. Ltd.',
      role: 'Flutter Developer',
      period: 'May 2024 – Present',
      project: 'RaphaCure Patient & Clinic Applications',
      description:
          'Engineered high-availability, cross-platform applications serving a production user base of 10K+ downloads.',
      bulletPoints: [
        'Engineered high-availability apps for 10K+ users on Play Store & App Store.',
        'Integrated microservices using GraphQL and REST APIs.',
        'Implemented Razorpay for payments and ZegoCloud for video calls.',
        'Collaborated with teams to resolve critical production issues.',
        'Managed full deployment lifecycle for Android and iOS.',
      ],
      googlePlay:
          'https://play.google.com/store/apps/details?id=com.cognonta.raphacure',
      appStore:
          'https://apps.apple.com/in/app/raphacure-work-family-care/id1637246098',
    ),
  ];
  static const List<Skills> services = [
    Skills(heading: 'Language', logo: AppAssets.languages, values: ['Dart']),
    Skills(
      heading: 'Framework',
      logo: AppAssets.scrappingLogo,
      values: ['Flutter', 'Bootstrap'],
    ),
    Skills(
      heading: 'Tools',
      logo: AppAssets.uiDesignLogo,
      values: ['Firebase', 'Figma'],
    ),
    Skills(
      heading: 'Technology',
      logo: AppAssets.androidLogo,
      values: ['Firebase', 'Figma', 'Version Control', 'Playstore Hosting'],
    ),
    Skills(
      heading: 'Familiar with',
      logo: AppAssets.androidLogo,
      values: ['HTML', 'CSS', 'JS', 'Go', 'Java', 'Python'],
    ),
    Skills(
      heading: 'Platforms',
      logo: AppAssets.androidLogo,
      values: ['Android - Flutter', "Web - Flutter, HTML and CSS"],
    ),
    Skills(
      heading: 'IDE(s)',
      logo: AppAssets.xcode,
      values: ['VSCode', 'Android Studio', 'XCode'],
    ),
    Skills(
      heading: 'Other Skills',
      logo: AppAssets.skills,
      values: ['REST APIs', 'Git', 'Playstore', 'Appstore'],
    ),
  ];
  static const List<Project> projects = [
    Project(
      name: 'Cyclea Period Tracker (Started)',
      githubRepoLink: "https://github.com/Aswanthds/cyclea_period_tracker",
      imageUrl:
          'https://raphacure-public-images.s3.ap-south-1.amazonaws.com/110118-1761184112800.png',
      description:
          "An AI enhanced period tracker app, made to track Womens's health & Period Data",
    ),
    // Project(
    //   name: 'Neram Dating App (On going)',
    //   imageUrl:
    //       'https://media.licdn.com/dms/image/v2/D562DAQHvr_5MKs8Zlw/profile-treasury-image-shrink_1920_1920/profile-treasury-image-shrink_1920_1920/0/1739361158319?e=1740567600&v=beta&t=Gc6EQGjvfRHHd2iu4ItccWXJ_F5mhfqzRaZISB1LNqI',
    //   description:
    //       'A Premium colaborating project with other 3 of my friends. A Dating application made using the flutter and firebase and other technologies ,an application for the people of kerala.',
    // ),
    Project(
      name: 'Kootu Dating App',
      imageUrl:
          'https://raphacure-public-images.s3.ap-south-1.amazonaws.com/110118-1761183891746.png',
      description:
          'An Simple Free User friendly Dating application for android users made using the flutter and firebase utilities to enhance the backend for Android devices.',
      githubRepoLink: 'https://github.com/Aswanthds/ipicku_dating_app',
      googlePlay:
          'https://play.google.com/store/apps/details?id=com.aswanth.ipicku',
      // previewLink: 'https://ipicku-dating-app-fire.firebaseapp.com/',
    ),
    Project(
      name: 'Avideo Video Player',
      imageUrl:
          'https://raphacure-public-images.s3.ap-south-1.amazonaws.com/110118-1761183891751.png',
      description:
          'An offline Application made for android users to play the videos in their devices',
      githubRepoLink: 'https://github.com/Aswanthds/avideo_video_player.git',
      googlePlay:
          'https://play.google.com/store/apps/details?id=com.avideo.avideo_video_player',
    ),
  ];
}
// git@github-personal:Aswanthds/aswanthds.github.io.git