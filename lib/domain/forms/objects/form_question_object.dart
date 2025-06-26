import 'package:forms_project/domain/forms/core/enums/_enums.dart';
import 'package:forms_project/domain/forms/objects/question_option_object.dart';

class FormQuestionObject {
  final String id;
  final String title;
  final String? description;
  final FormInputType type;
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
}
