class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final String? githubLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
    this.githubLink,
  });
}


// ###############
// WORK PROJECTS
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/pro2.png',
    title: 'Krishi suvidha',
    subtitle:
    'farmer one step solution',
    githubLink:
    'https://github.com/nayankumar01/PRAYATNA/',
  ),
  ProjectUtils(
    image: 'assets/projects/pro1.jpg',
    title: 'Automation In Polyhouse',
    subtitle:
    'A remote controlled system made by using arduino node MCU 8266, sensors and actuators. specially for farmers those are working for the polyhouse environment.',
    githubLink:
    'https://github.com/Hrishabh-01/Automation-in-Polyhouse',
  ),
  ProjectUtils(
    image: 'assets/projects/pro3.png',
    title: 'Hospital Management System',
    subtitle:
    'This is a project on hospital management which is based on OOPS concept of c++ and file handling which saves the outcome(Receipt) in the form of word file.',
    githubLink:
    'https://github.com/Hrishabh-01/Hospital-management-system',
  ),
];