import 'package:equatable/equatable.dart';

class DropdownModel extends Equatable {
  final String id;
  final String description;

  const DropdownModel(this.id, this.description);

  @override
  List<Object?> get props => [id, description];
}
