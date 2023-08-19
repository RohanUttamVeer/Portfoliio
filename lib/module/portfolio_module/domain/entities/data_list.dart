import 'package:equatable/equatable.dart';

class DataList extends ApiResoponseList {
  final List<dynamic>? data;
  DataList({required this.data});
}

class ApiResoponseList extends Equatable {
  final List<dynamic>? data;

  ApiResoponseList({this.data});

  ApiResoponseList.fromJson(dynamic json) : data = json;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['data'] = data;
  //   return map;
  // }

  DataList toEntity() => DataList(data: data);

  @override
  List<Object?> get props => [data];
}
