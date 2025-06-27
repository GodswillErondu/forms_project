import 'package:forms_project/domain/forms/objects/form_question_object.dart';

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
  
  QuestionOptionObject copyWith({
     String? id,
     int? order,
     String? title,
     String? description,
     String? fileUrl,
     String? mimeType,
}) {
    return QuestionOptionObject(
        id: id ?? this.id,
        order: order ?? this.order,
      title: title ?? this.title,
      description: description ?? this.description,
      fileUrl: fileUrl ?? this.fileUrl,
      mimeType: mimeType ?? this.mimeType,
    );
  }
  
}
