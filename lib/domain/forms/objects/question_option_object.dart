class QuestionOptionObject {
  final String id;
  final int order;
  final String? title;
  final String? description;
  final String? fileUrl;
  final String? mimeType;

  QuestionOptionObject({
    required this.id,
    required this.order,
    this.title,
    this.description,
    this.fileUrl,
    this.mimeType,
  });
}
