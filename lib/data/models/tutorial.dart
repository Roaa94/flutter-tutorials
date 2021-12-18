class Tutorial {
  String title;
  String description;
  String? tutorialLink;
  String? tutorialPageRoute;

  Tutorial({
    required this.title,
    required this.description,
    this.tutorialLink,
    this.tutorialPageRoute,
  });
}
