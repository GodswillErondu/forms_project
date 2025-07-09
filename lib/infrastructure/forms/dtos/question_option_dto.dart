import 'package:forms_project/domain/forms/objects/question_option_object.dart';

class QuestionOptionDto {
  final String id;
  final int order;
  final String title;
  final String description;
  final String? fileUrl;
  final String? mimeType;

  const QuestionOptionDto({
    required this.id,
    required this.order,
    this.title = '',
    this.description = '',
    this.fileUrl,
    this.mimeType,
  });

  factory QuestionOptionDto.fromDomain(QuestionOptionObject domain) {
    return QuestionOptionDto(
      id: domain.id,
      order: domain.order,
      title: domain.title,
      description: domain.description,
      fileUrl: domain.fileUrl,
      mimeType: domain.mimeType,
    );
  }

  QuestionOptionObject toDomain() {
    return QuestionOptionObject(
      id: id,
      order: order,
      title: title,
      description: description,
      fileUrl: fileUrl,
      mimeType: mimeType,
    );
  }

  factory QuestionOptionDto.fromJson(Map<String, dynamic> json) {
    return QuestionOptionDto(
      id: json['id'] as String,
      order: json['order'] as int,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      fileUrl: json['fileUrl'] as String?,
      mimeType: json['mimeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order': order,
      'title': title,
      'description': description,
      if (fileUrl != null) 'fileUrl': fileUrl,
      if (mimeType != null) 'mimeType': mimeType,
    };
  }

  @override
  String toString() => 'QuestionOptionDto(id: $id, title: $title)';


}