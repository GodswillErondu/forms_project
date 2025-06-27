import 'package:forms_project/domain/forms/core/enums/_enums.dart';
import 'package:forms_project/domain/forms/objects/question_option_object.dart';

class FormQuestionObject {
  final String id;
  final String title;
  final String? description;
  final FormInputTypeEnum type;
  final bool required;
  final int order;
  final List<QuestionOptionObject>? options;

  FormQuestionObject({
    required this.id,
    required this.title,
    this.description,
    required this.type,
    required this.required,
    required this.order,
    this.options,
  });

  FormQuestionObject copyWith({
    String? id,
    String? title,
    String? description,
    FormInputTypeEnum? type,
    bool? required,
    int? order,
    List<QuestionOptionObject>? options,
  }) {
    return FormQuestionObject(
      id: id ?? this.id,
      title: title ?? this.id,
      description: description ?? this.description,
      type: type ?? this.type,
      required: required ?? this.required,
      order: order ?? this.order,
      options: options ?? this.options,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      type.hashCode ^
      required.hashCode ^
      order.hashCode ^
      options.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FormQuestionObject && other.hashCode == hashCode;
  }

}
