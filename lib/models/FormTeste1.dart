/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the FormTeste1 type in your schema. */
class FormTeste1 extends amplify_core.Model {
  static const classType = const _FormTeste1ModelType();
  final String id;
  final String? _nome;
  final String? _infor;
  final String? _tipoteste;
  final String? _descricao;
  final bool? _finalizado;
  final String? _bddLongo;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  FormTeste1ModelIdentifier get modelIdentifier {
      return FormTeste1ModelIdentifier(
        id: id
      );
  }
  
  String get nome {
    try {
      return _nome!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get infor {
    try {
      return _infor!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get tipoteste {
    try {
      return _tipoteste!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get descricao {
    try {
      return _descricao!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get finalizado {
    try {
      return _finalizado!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get bddLongo {
    try {
      return _bddLongo!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const FormTeste1._internal({required this.id, required nome, required infor, required tipoteste, required descricao, required finalizado, required bddLongo, createdAt, updatedAt}): _nome = nome, _infor = infor, _tipoteste = tipoteste, _descricao = descricao, _finalizado = finalizado, _bddLongo = bddLongo, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory FormTeste1({String? id, required String nome, required String infor, required String tipoteste, required String descricao, required bool finalizado, required String bddLongo}) {
    return FormTeste1._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      nome: nome,
      infor: infor,
      tipoteste: tipoteste,
      descricao: descricao,
      finalizado: finalizado,
      bddLongo: bddLongo);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FormTeste1 &&
      id == other.id &&
      _nome == other._nome &&
      _infor == other._infor &&
      _tipoteste == other._tipoteste &&
      _descricao == other._descricao &&
      _finalizado == other._finalizado &&
      _bddLongo == other._bddLongo;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("FormTeste1 {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("nome=" + "$_nome" + ", ");
    buffer.write("infor=" + "$_infor" + ", ");
    buffer.write("tipoteste=" + "$_tipoteste" + ", ");
    buffer.write("descricao=" + "$_descricao" + ", ");
    buffer.write("finalizado=" + (_finalizado != null ? _finalizado!.toString() : "null") + ", ");
    buffer.write("bddLongo=" + "$_bddLongo" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  FormTeste1 copyWith({String? nome, String? infor, String? tipoteste, String? descricao, bool? finalizado, String? bddLongo}) {
    return FormTeste1._internal(
      id: id,
      nome: nome ?? this.nome,
      infor: infor ?? this.infor,
      tipoteste: tipoteste ?? this.tipoteste,
      descricao: descricao ?? this.descricao,
      finalizado: finalizado ?? this.finalizado,
      bddLongo: bddLongo ?? this.bddLongo);
  }
  
  FormTeste1 copyWithModelFieldValues({
    ModelFieldValue<String>? nome,
    ModelFieldValue<String>? infor,
    ModelFieldValue<String>? tipoteste,
    ModelFieldValue<String>? descricao,
    ModelFieldValue<bool>? finalizado,
    ModelFieldValue<String>? bddLongo
  }) {
    return FormTeste1._internal(
      id: id,
      nome: nome == null ? this.nome : nome.value,
      infor: infor == null ? this.infor : infor.value,
      tipoteste: tipoteste == null ? this.tipoteste : tipoteste.value,
      descricao: descricao == null ? this.descricao : descricao.value,
      finalizado: finalizado == null ? this.finalizado : finalizado.value,
      bddLongo: bddLongo == null ? this.bddLongo : bddLongo.value
    );
  }
  
  FormTeste1.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _nome = json['nome'],
      _infor = json['infor'],
      _tipoteste = json['tipoteste'],
      _descricao = json['descricao'],
      _finalizado = json['finalizado'],
      _bddLongo = json['bddLongo'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'nome': _nome, 'infor': _infor, 'tipoteste': _tipoteste, 'descricao': _descricao, 'finalizado': _finalizado, 'bddLongo': _bddLongo, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'nome': _nome,
    'infor': _infor,
    'tipoteste': _tipoteste,
    'descricao': _descricao,
    'finalizado': _finalizado,
    'bddLongo': _bddLongo,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<FormTeste1ModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<FormTeste1ModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NOME = amplify_core.QueryField(fieldName: "nome");
  static final INFOR = amplify_core.QueryField(fieldName: "infor");
  static final TIPOTESTE = amplify_core.QueryField(fieldName: "tipoteste");
  static final DESCRICAO = amplify_core.QueryField(fieldName: "descricao");
  static final FINALIZADO = amplify_core.QueryField(fieldName: "finalizado");
  static final BDDLONGO = amplify_core.QueryField(fieldName: "bddLongo");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FormTeste1";
    modelSchemaDefinition.pluralName = "FormTeste1s";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FormTeste1.NOME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FormTeste1.INFOR,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FormTeste1.TIPOTESTE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FormTeste1.DESCRICAO,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FormTeste1.FINALIZADO,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FormTeste1.BDDLONGO,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _FormTeste1ModelType extends amplify_core.ModelType<FormTeste1> {
  const _FormTeste1ModelType();
  
  @override
  FormTeste1 fromJson(Map<String, dynamic> jsonData) {
    return FormTeste1.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'FormTeste1';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [FormTeste1] in your schema.
 */
class FormTeste1ModelIdentifier implements amplify_core.ModelIdentifier<FormTeste1> {
  final String id;

  /** Create an instance of FormTeste1ModelIdentifier using [id] the primary key. */
  const FormTeste1ModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'FormTeste1ModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FormTeste1ModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}