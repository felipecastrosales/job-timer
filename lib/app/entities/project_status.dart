enum ProjectStatus {
  in_loading(label: 'In Loading'),
  finished(label: 'Finished');

  final String label;
  const ProjectStatus({required this.label});
}
