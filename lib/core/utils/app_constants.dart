import 'package:portfolio/core/utils/app_assets.dart';

import '../../data/models/custom_service.dart';
import '../../data/models/project.dart';

abstract class AppConstants {
  static const double appBarHeight = 80;
  static const List<Skills> services = [
    Skills(
      heading: 'Language',
      logo: AppAssets.languages,
      values: [
        'Dart',
      ],
    ),
    Skills(
      heading: 'Framework',
      logo: AppAssets.scrappingLogo,
      values: [
        'Flutter',
        'Bootstrap',
      ],
    ),
    Skills(
      heading: 'Tools',
      logo: AppAssets.uiDesignLogo,
      values: [
        'Firebase',
        'Figma',
      ],
    ),
    Skills(
      heading: 'Technology',
      logo: AppAssets.androidLogo,
      values: [
        'Firebase',
        'Figma',
        'Version Control',
        'Playstore Hosting',
      ],
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
      name: 'Recipe Book (Started)',
      imageUrl:
          'https://m.media-amazon.com/images/I/51LGD300xqL._UF1000,1000_QL80_.jpg',
      description:
          'Its a recipe book thats made everyone a experience cook made using flutter. ',
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
          'https://drive.google.com/uc?export=view&id=1JTxMJhIywWTa8qPaFC6HccLGVMEGQIKK',
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
          'https://play-lh.googleusercontent.com/sJhW7ubzKGJ1moYmSxd6X9o2scsBxLTRvgvvjtEd2nOHaDG0mYQIY4gNbeST-06XfYg=w240-h480',
      description:
          'An offline Application made for android users to play the videos in their devices',
      githubRepoLink: 'https://github.com/Aswanthds/avideo_video_player.git',
      googlePlay:
          'https://play.google.com/store/apps/details?id=com.avideo.avideo_video_player',
    ),
  ];
}
