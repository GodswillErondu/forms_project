
import 'package:forms_project/domain/form/objects/question_option_object.dart';
import 'package:hive/hive.dart';

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

class QuestionOptionDtoAdapter extends TypeAdapter<QuestionOptionDto> {
  @override
  final int typeId = 4; // ✅ Make sure this ID is unique across your entire app

  @override
  QuestionOptionDto read(BinaryReader reader) {
    return QuestionOptionDto(
      id: reader.readString(),
      order: reader.readInt(),
      title: reader.readString(),
      description: reader.readString(),
      fileUrl: reader.readBool() ? reader.readString() : null,
      mimeType: reader.readBool() ? reader.readString() : null,
    );
  }

  @override
  void write(BinaryWriter writer, QuestionOptionDto obj) {
    writer.writeString(obj.id);
    writer.writeInt(obj.order);
    writer.writeString(obj.title);
    writer.writeString(obj.description);

    if (obj.fileUrl != null) {
      writer.writeBool(true);
      writer.writeString(obj.fileUrl!);
    } else {
      writer.writeBool(false);
    }

    if (obj.mimeType != null) {
      writer.writeBool(true);
      writer.writeString(obj.mimeType!);
    } else {
      writer.writeBool(false);
    }
  }
}