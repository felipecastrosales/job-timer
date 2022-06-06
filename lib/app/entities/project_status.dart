enum ProjectStatus {
  inLoading(label: 'In Loading'),
  finished(label: 'Finished');

  final String label;
  const ProjectStatus({required this.label});
}
