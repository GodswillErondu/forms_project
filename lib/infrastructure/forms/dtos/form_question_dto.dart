import 'package:forms_project/domain/core/_enums.dart';
import 'package:forms_project/domain/forms/objects/form_question_object.dart';
import 'package:forms_project/infrastructure/forms/dtos/question_option_dto.dart';

class FormQuestionDto {
  final String id;
  final String title;
  final String description;
  final FormInputTypeEnum type;
  final bool required;
  final int order;
  final List<QuestionOptionDto>? options;

  const FormQuestionDto({
    required this.id,
    required this.title,
    this.description = '',
    required this.type,
    required this.required,
    required this.order,
    this.options,
  });

  factory FormQuestionDto.fromDomain(FormQuestionObject domain) {
    return FormQuestionDto(
      id: domain.id,
      title: domain.title,
      description: domain.description,
      type: domain.type,
      required: domain.required,
      order: domain.order,
      options: domain.options?.map(QuestionOptionDto.fromDomain).toList(),
    );
  }

  FormQuestionObject toDomain() {
    return FormQuestionObject(
      id: id,
      title: title,
      description: description,
      type: type,
      required: required,
      order: order,
      options: options?.map((dto) => dto.toDomain()).toList(),
    );
  }

  factory FormQuestionDto.fromJson(Map<String, dynamic> json) {
    return FormQuestionDto(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      type: FormInputTypeEnum.values.firstWhere(
            (e) => e.name == json['type'],
        orElse: () => throw FormatException('Invalid FormInputTypeEnum value'),
      ),
      required: json['required'] as bool,
      order: json['order'] as int,
      options: json['options'] != null
          ? (json['options'] as List)
          .map((e) => QuestionOptionDto.fromJson(e as Map<String, dynamic>))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type.name,
      'required': required,
      'order': order,
      'options': options?.map((o) => o.toJson()).toList(),
    };
  }

  @override
  String toString() => 'FormQuestionDto(id: $id, title: $title, type: $type)';

}