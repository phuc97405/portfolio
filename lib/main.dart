import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Ngoc Phuc - CV',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le Ngoc Phuc - CV'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              SizedBox(height: 20),
              ObjectiveSection(),
              SizedBox(height: 20),
              SkillsSection(),
              SizedBox(height: 20),
              WorkExperienceSection(),
              SizedBox(height: 20),
              EducationSection(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Le Ngoc Phuc',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'Mobile Developer',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'Phone: 0396900698 | Email: phuc97405@gmail.com',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'Address: 12 District, HCM City',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'Date of Birth: January 01, 1999 | Gender: Male',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'GitHub: https://github.com/phuc97405',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class ObjectiveSection extends StatelessWidget {
  const ObjectiveSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Objective',
      content: const Text(
        'I am a dedicated mobile app developer with 4 years of experience in the industry. For the past 3 years, I '
        'have specialized in React Native, and more recently, I expanded my expertise with a year of Flutter '
        'development. I am driven by a strong commitment to continuous learning and a deep sense of responsibility '
        'in my work. I am enthusiastic about the opportunity to bring my skills and experience to your company, where '
        'I aim to further enhance my knowledge and abilities, while making significant contributions to your projects '
        'and overall success.',
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Skills',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkillItem(skill: 'General Flutter with Bloc pattern.'),
          SkillItem(skill: 'React Native (JavaScript, TypeScript).'),
          SkillItem(skill: 'Dependency Injection architecture.'),
          SkillItem(skill: 'Work with Figma, Git, Jira.'),
          SkillItem(
              skill:
                  'Experienced in working with RESTful APIs using dio packages.'),
          SkillItem(
              skill:
                  'Strong understanding of asynchronous programming with async/await, Future, and Stream.'),
          SkillItem(
              skill:
                  'Knowledgeable in integrating local databases like SQLite and cloud databases like Firebase Firestore.'),
          SkillItem(
              skill:
                  'Distribute Android and iOS applications (GooglePlay store and Apple Appstore).'),
        ],
      ),
    );
  }
}

class SkillItem extends StatelessWidget {
  final String skill;

  SkillItem({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Expanded(child: Text(skill)),
        ],
      ),
    );
  }
}

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Work Experience',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Job(
            company: 'BrickMate Group Company',
            duration: 'October 2021 - Present',
            role: 'Mobile Developer',
            description:
                'Development using Flutter(Dart). Technologies used: Flutter, Firebase, Push notification, '
                'BloC, animated, Iamport. I build source, authen, user profile and community:\n'
                ' - Login with social naver, kakao, gmail, apple.\n'
                ' - Comment post, like post, rep comment, like comment.\n'
                ' - Build UI drag and drop from web (text, image).\n'
                'Team size app: 3.',
          ),
          Job(
            company: 'Dfm-Engineering Company',
            duration: 'June 2020 - September 2021',
            role: 'Mobile Developer',
            description:
                'Participate in developing, upgrading and optimizing Camera_AI application to help manage cameras and users with some outstanding features such as Camera, nfc. Get Api and Google Map. Team size app: 5.\n'
                'Project Outinord Eos(Management of calculation of concrete through temperature):\n'
                'Participate in the development, upgrade, and optimization of Outinord Eos. Job Description:\n'
                'Build the entire application. The application connects to the usb-serial interface to receive the signal from the breadboard. get the temperature get api. Read excel and get calculated data. create fire excel, file csv.\n'
                'Team size app: 5.',
          ),
        ],
      ),
    );
  }
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Education',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EducationItem(
            institution: 'Fpt Polytechnic',
            duration: 'Sep 2017 - Mar 2020',
            major: 'Software Engineer',
            description:
                'The learning environment is very dynamic and gives me a lot of background knowledge. Help me become more complete, energetic, more confident.',
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final Widget content;

  Section({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          content,
        ],
      ),
    );
  }
}

class Job extends StatelessWidget {
  final String company;
  final String duration;
  final String role;
  final String description;

  Job({
    required this.company,
    required this.duration,
    required this.role,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(company,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(duration),
          Text(role,
              style:
                  const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          Text(description),
        ],
      ),
    );
  }
}

class EducationItem extends StatelessWidget {
  final String institution;
  final String duration;
  final String major;
  final String description;

  EducationItem(
      {required this.institution,
      required this.duration,
      required this.major,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(institution,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(duration),
          Text(major,
              style:
                  const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          Text(description),
        ],
      ),
    );
  }
}
