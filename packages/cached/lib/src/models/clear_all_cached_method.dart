import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:cached/src/config.dart';
import 'package:cached/src/models/param.dart';
import 'package:cached_annotation/cached_annotation.dart';

import 'package:source_gen/source_gen.dart';

class ClearAllCachedMethod {
  const ClearAllCachedMethod({
    required this.name,
    required this.returnType,
    required this.isAsync,
    required this.params,
    required this.isAbstract,
  });

  final String name;
  final String returnType;
  final bool isAbstract;
  final bool isAsync;
  final Iterable<Param> params;

  factory ClearAllCachedMethod.fromElement(MethodElement element, Config config) {
    return ClearAllCachedMethod(
      name: element.name,
      returnType: element.returnType.getDisplayString(withNullability: true),
      isAsync: element.isAsynchronous,
      isAbstract: element.isAbstract,
      params: element.parameters.map((e) => Param.fromElement(e, config)),
    );
  }

  static DartObject? getAnnotation(MethodElement element) {
    const methodAnnotationChecker = TypeChecker.fromRuntime(ClearCached);
    return methodAnnotationChecker.firstAnnotationOf(element);
  }
}
