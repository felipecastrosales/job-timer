enum ProjectStatus {
  inLoading(label: 'In Loading'),
  finished(label: 'Finished');

  const ProjectStatus({required this.label});
  final String label;
}
