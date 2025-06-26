import 'package:forms_project/domain/forms/objects/form_question_object.dart';

class FormObject {
  final String id;
  final String author;
  final List<String> to;
  final String title;
  final String? subtitle;
  final String? description;
  final DateTime dateCreated;
  final DateTime dateModified;
  final bool isPublished;
  final String? thumbnailUrl;
  final String themeColorHex;
  final String backgroundColorHex;
  final String titleColorHex;
  final int? maxQuestionsToAnswer;
  final List<FormQuestionObject> questions;

  FormObject({
    required this.id,
    required this.author,
    required this.to,
    required this.title,
    this.subtitle,
    this.description,
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

  FormObject copyWith({
    String? id,
    String? author,
    List<String>? to,
    String? title,
    String? subtitle,
    String? description,
    DateTime? dateCreated,
    DateTime? dateModified,
    bool? isPublished,
    String? thumbnailUrl,
    String? themeColorHex,
    String? backgroundColorHex,
    String? titleColorHex,
    int? maxQuestionsToAnswer,
    List<FormQuestionObject>? questions,
  }) {
    return FormObject(
      id: id ?? this.id,
      author: author ?? this.author,
      to: to ?? List.from(this.to),
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      dateCreated: dateCreated ?? this.dateCreated,
      dateModified: dateModified ?? this.dateModified,
      isPublished: isPublished ?? this.isPublished,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      themeColorHex: themeColorHex ?? this.themeColorHex,
      backgroundColorHex: backgroundColorHex ?? this.backgroundColorHex,
      titleColorHex: titleColorHex ?? this.titleColorHex,
      maxQuestionsToAnswer: maxQuestionsToAnswer ?? this.maxQuestionsToAnswer,
      questions: questions ?? List.from(this.questions),
    );
  }


  @override
  int get hashCode =>
      id.hashCode ^
      author.hashCode ^
      to.hashCode ^
      title.hashCode ^
      subtitle.hashCode ^
      description.hashCode ^
      dateCreated.hashCode ^
      dateModified.hashCode ^
      isPublished.hashCode ^
      thumbnailUrl.hashCode ^
      themeColorHex.hashCode ^
      backgroundColorHex.hashCode ^
      titleColorHex.hashCode ^
      maxQuestionsToAnswer.hashCode ^
      questions.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FormObject && other.hashCode == hashCode;
  }


}
