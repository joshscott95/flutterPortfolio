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
    image: 'assets/projects/geiger_counter.png',
    title: 'Geiger counter',
    subtitle: 'Measures radiation samples',
    webLink: '',
    githubLink: '',
  ),
  ProjectUtils(
    image: 'assets/projects/eggescape.png',
    title: 'egg escape',
    subtitle: 'JS Sidescroller',
    webLink: 'https://github.com/joshscott95/Egg-Escape',
    githubLink: 'https://github.com/joshscott95/Egg-Escape',
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
    image: 'assets/projects/autoflow.png',
    title: 'autoflow',
    subtitle: 'Auto dealership CRM',
    webLink: 'https://github.com/joshscott95/AutoFlow',
    githubLink: 'https://github.com/joshscott95/AutoFlow',
  ),
  ProjectUtils(
    image: 'assets/projects/confgo.png',
    title: 'confgo',
    subtitle: 'Conference event planning',
    webLink: 'https://github.com/joshscott95/Conference_GO',
    githubLink: 'https://github.com/joshscott95/Conference_GO',
  ),
];