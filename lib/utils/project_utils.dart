class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? iosLink;
  final String? webLink;
  final String? githubLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.iosLink,
    this.webLink,
    this.githubLink,
  });
}

List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/',
    title: 'Geiger counter',
    subtitle: '',
    webLink: '',
  ),
  ProjectUtils(
    image: 'assets/projects/',
    title: 'egg escape',
    subtitle: '',
    webLink: '',
  ),
];

List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/sagesoc.png',
    title: 'Sage Society',
    subtitle: 'plant based social media app',
    webLink: 'https://github.com/joshscott95/SageSociety',
    githubLink: 'https://github.com/joshscott95/SageSociety',
  ),
  ProjectUtils(
    image: 'assets/projects/',
    title: 'autoflow',
    subtitle: '',
    webLink: '',
  ),
  ProjectUtils(
    image: 'assets/projects/',
    title: 'confgo',
    subtitle: '',
    webLink: '',
  ),
];