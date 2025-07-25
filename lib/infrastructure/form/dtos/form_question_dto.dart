import 'package:forms_project/domain/core/_enums.dart';
import 'package:forms_project/domain/form/objects/form_question_object.dart';
import 'package:forms_project/infrastructure/form/dtos/question_option_dto.dart';
import 'package:hive/hive.dart';

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
          ? List<Map<String, dynamic>>.from(json['options'])
          .map(QuestionOptionDto.fromJson)
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

class FormQuestionDtoAdapter extends TypeAdapter<FormQuestionDto> {
  @override
  final int typeId = 5;

  @override
  FormQuestionDto read(BinaryReader reader) {
    return FormQuestionDto(
      id: reader.readString(),
      title: reader.readString(),
      description: reader.readString(),
      type: reader.read() as FormInputTypeEnum,
      required: reader.readBool(),
      order: reader.readInt(),
      options: reader.readList().cast<QuestionOptionDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, FormQuestionDto obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.description);
    writer.write(obj.type); 
    writer.writeBool(obj.required);
    writer.writeInt(obj.order);
    writer.writeList(obj.options ?? []);
  }
}
