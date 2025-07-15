import 'package:forms_project/domain/forms/objects/form_object.dart';
import 'form_question_dto.dart';

class FormDto {
  final String id;
  final String author;
  final List<String> to;
  final String title;
  final String subtitle;
  final String description;
  final DateTime dateCreated;
  final DateTime dateModified;
  final bool isPublished;
  final String? thumbnailUrl;
  final String themeColorHex;
  final String backgroundColorHex;
  final String titleColorHex;
  final int? maxQuestionsToAnswer;
  final List<FormQuestionDto> questions;

  const FormDto({
    required this.id,
    required this.author,
    required this.to,
    required this.title,
    this.subtitle = '',
    this.description = '',
    required this.dateCreated,
    required this.dateModified,
    required this.isPublished,
    this.thumbnailUrl,
    required this.themeColorHex,
    required this.backgroundColorHex,
    required this.titleColorHex,
    this.maxQuestionsToAnswer,
    required this.questions,
  });

  factory FormDto.fromDomain(FormObject formObject) {
    return FormDto(
      id: formObject.id,
      author: formObject.author,
      to: formObject.to,
      title: formObject.title,
      subtitle: formObject.subtitle,
      description: formObject.description,
      dateCreated: formObject.dateCreated,
      dateModified: formObject.dateModified,
      isPublished: formObject.isPublished,
      thumbnailUrl: formObject.thumbnailUrl,
      themeColorHex: formObject.themeColorHex,
      backgroundColorHex: formObject.backgroundColorHex,
      titleColorHex: formObject.titleColorHex,
      maxQuestionsToAnswer: formObject.maxQuestionsToAnswer,
      questions: formObject.questions.map(FormQuestionDto.fromDomain).toList(),
    );
  }

  FormObject toDomain() {
    return FormObject(
      id: id,
      author: author,
      to: to,
      title: title,
      subtitle: subtitle,
      description: description,
      dateCreated: dateCreated,
      dateModified: dateModified,
      isPublished: isPublished,
      thumbnailUrl: thumbnailUrl,
      themeColorHex: themeColorHex,
      backgroundColorHex: backgroundColorHex,
      titleColorHex: titleColorHex,
      maxQuestionsToAnswer: maxQuestionsToAnswer,
      questions: questions.map((dto) => dto.toDomain()).toList(),
    );
  }

  factory FormDto.fromJson(Map<String, dynamic> json) {
    return FormDto(
      id: json['id'] as String,
      author: json['author'] as String,
      to: (json['to'] as List).map((e) => e as String).toList(),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String? ?? '',
      description: json['description'] as String? ?? '',
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      dateModified: DateTime.parse(json['dateModified'] as String),
      isPublished: json['isPublished'] as bool,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      themeColorHex: json['themeColorHex'] as String,
      backgroundColorHex: json['backgroundColorHex'] as String,
      titleColorHex: json['titleColorHex'] as String,
      maxQuestionsToAnswer: json['maxQuestionsToAnswer'] as int?,
      questions: (json['questions'] as List)
          .map((e) => FormQuestionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'to': to,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'dateCreated': dateCreated.toIso8601String(),
      'dateModified': dateModified.toIso8601String(),
      'isPublished': isPublished,
      'thumbnailUrl': thumbnailUrl,
      'themeColorHex': themeColorHex,
      'backgroundColorHex': backgroundColorHex,
      'titleColorHex': titleColorHex,
      'maxQuestionsToAnswer': maxQuestionsToAnswer,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }

  @override
  String toString() => 'FormObjectDto('
      'id: $id, '
      'title: $title, '
      'questions: ${questions.length} items'
      ')';
}