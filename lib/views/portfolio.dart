import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le Ngoc Phuc Flutter'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            const SizedBox(height: 16.0),
            buildObjective(),
            const SizedBox(height: 16.0),
            buildSkills(),
            const SizedBox(height: 16.0),
            buildWorkExperience(),
            const SizedBox(height: 16.0),
            buildEducation(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Le Ngoc Phuc',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text('Mobile Developer'),
        SizedBox(height: 8.0),
        Text('Date of birth: January 01, 1999'),
        Text('Gender: Male'),
        Text('Phone: 0396900698'),
        Text('Email: phuc97405@gmail.com'),
        Text('Address: 12 District, HCM City'),
        Text('Website: https://github.com/phuc97405'),
      ],
    );
  }

  Widget buildObjective() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OBJECTIVE',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'I am a dedicated mobile app developer with 4 years of experience in the industry. '
          'For the past 3 years, I have specialized in React Native, and more recently, I expanded my expertise with a year of Flutter development. '
          'I am driven by a strong commitment to continuous learning and a deep sense of responsibility in my work. '
          'I am enthusiastic about the opportunity to bring my skills and experience to your company, where I aim to further enhance my knowledge and abilities, '
          'while making significant contributions to your projects and overall success.',
        ),
      ],
    );
  }

  Widget buildSkills() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SKILLS',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text('- General Flutter with Bloc pattern.'),
        Text('- React Native (JavaScript, TypeScript).'),
        Text('- Dependency Injection architecture.'),
        Text('- Work with Figma, Git, Jira.'),
        Text('- Build Flutter code base projects.'),
        Text('- Using BLoC, GetX to manage state.'),
        Text('- Experienced in working with RESTful APIs using dio packages.'),
        Text(
            '- Experience in working with Scrum Agile, Firebase, Restful API, Push Notification.'),
        Text('- English for work, English document research skills.'),
        Text(
            '- Strong understanding of asynchronous programming with async/await, Future, and Stream.'),
        Text(
            '- Knowledgeable in integrating local databases like SQLite and cloud databases like Firebase Firestore.'),
        Text(
            '- Distribute Android and iOS applications (GooglePlay store and Apple Appstore).'),
      ],
    );
  }

  Widget buildWorkExperience() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'WORK EXPERIENCE',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        buildJobExperience(
          title: 'BrickMate Group Company',
          period: 'October 2021 - Present',
          role: 'Mobile Developer',
          projects: [
            'Project VividPlus (Advertising Brand and review brand):\n'
                '- Development using Flutter(Dart).\n'
                '- Technologies used: Flutter, Firebase, Push notification, BloC, animated, Iamport.\n'
                '- Built source, authentication, user profile, and community modules.',
            'Project Mildang (Monitor your blood sugar health):\n'
                '- Development using React Native (JavaScript, TypeScript).\n'
                '- Technologies used: React-native, React-navigation, Firebase, Push notification, React-query, Form-hook, Animated, Ads, Dynamic Link, MobX, Analytics.\n'
                '- Built authentication, sugar diary, local alarm, my page, and push notification.',
            'Project Namuh (Crypto wallet):\n'
                '- Technologies used: React-native, Mobx, React-navigation.\n'
                '- Team size: 3.',
            'Project LocalLiquor (Manage your favorite drinks in Korea):\n'
                '- Technologies used: React-native, Redux, Iamport 3rd, Push notification, React-navigation, Firebase.\n'
                '- Team size: 3.',
          ],
        ),
        buildJobExperience(
          title: 'Dfm-Engineering Company',
          period: 'June 2020 - September 2021',
          role: 'Mobile Developer',
          projects: [
            'Project Camera AI (Manager user and device):\n'
                '- Participated in developing, upgrading, and optimizing Camera_AI application.\n'
                '- Features: Camera, NFC, Get API and Google Map.\n'
                '- Team size: 5.',
            'Project Outinord Eos (Management of calculation of concrete through temperature):\n'
                '- Participated in development, upgrade, and optimization.\n'
                '- Built entire application.\n'
                '- Features: USB-serial interface connection, temperature data retrieval, API integration, Excel and CSV data handling.\n'
                '- Team size: 5.',
          ],
        ),
      ],
    );
  }

  Widget buildJobExperience(
      {required String title,
      required String period,
      required String role,
      required List<String> projects}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(period),
        Text(role),
        const SizedBox(height: 8.0),
        ...projects.map((project) => Text(project)).toList(),
      ],
    );
  }

  Widget buildEducation() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EDUCATION',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'Fpt Polytechnic\n'
          'Major: Software Engineer\n'
          'Sep 2017 - Mar 2020\n'
          'The learning environment is very dynamic and gives me a lot of background knowledge. '
          'Helped me become more complete, energetic, and more confident.',
        ),
      ],
    );
  }
}
