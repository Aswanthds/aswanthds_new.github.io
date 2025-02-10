import '../../data/models/custom_service.dart';
import '../../data/models/project.dart';

abstract class AppConstants {
  static const double appBarHeight = 80;
  static const List<Skills> services = [
    Skills(
      heading: 'Language',
      //logo: AppAssets.androidLogo,
      values: ['Dart'],
    ),
    Skills(
        heading: 'Framework',
        //logo: AppAssets.androidLogo,
        values: [
          'Flutter',
          'Bootstrap',
        ]),
    Skills(
      heading: 'Tools',
      //logo: AppAssets.androidLogo,
      values: [
        'Firebase',
        'Figma',
      ],
    ),
    Skills(
      heading: 'Technology',
      //logo: AppAssets.androidLogo,
      values: [
        'Firebase',
        'Figma',
        'Version Control',
        'Playstore Hosting',
      ],
    ),
    Skills(
      heading: 'Familiar with',
      //logo: AppAssets.androidLogo,
      values: [
        'HTML',
        'CSS',
        'JS',
      ],
    ),
    Skills(
      heading: 'Platforms',
      //logo: AppAssets.androidLogo,
      values: ['Android – Flutter', 'Web – Flutter, HTML and CSS'],
    ),
    Skills(
      heading: 'IDE(s)',
      //logo: AppAssets.androidLogo,
      values: ['VSCode', 'Android Studio'],
    ),
    Skills(
      heading: 'Other Skills',
      //logo: AppAssets.androidLogo,
      values: ['REST APIs', 'Git', 'Playstore Hosting'],
    ),
  ];
  static const List<Project> projects = [
    Project(
        name: 'I Pick U Dating App',
        imageUrl:
            'https://play-lh.googleusercontent.com/q0y-_lJXIcJctGVTztkbiafB7oQEcsjNQnxoZ18T1Ky78Zr79i9W-2HeOjJ2f68vK7Q=w240-h480',
        description:
            'A Dating application made using the flutter and firebase utilities to enhance the backend for Android devices.',
        githubRepoLink: 'https://github.com/Aswanthds/ipicku_dating_app',
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.aswanth.ipicku',
        previewLink: 'https://ipicku-dating-app-fire.firebaseapp.com/'),
    Project(
      name: 'Avideo Video Player',
      imageUrl:
          'https://play-lh.googleusercontent.com/sJhW7ubzKGJ1moYmSxd6X9o2scsBxLTRvgvvjtEd2nOHaDG0mYQIY4gNbeST-06XfYg=w240-h480',
      description:
          'Social media application for share posts and stories with people, One-to-one chat, Share reels videos',
      githubRepoLink: 'https://github.com/Aswanthds/avideo_video_player.git',
      googlePlay:
          'https://play.google.com/store/apps/details?id=com.avideo.avideo_video_player',
    ),
  ];
}
