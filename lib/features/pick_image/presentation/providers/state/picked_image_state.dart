import 'package:equatable/equatable.dart';
import 'package:faro_clean_tdd/features/pick_image/domain/entities/picked_image.dart';

abstract class PickedImageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Initial extends PickedImageState {}

class Loading extends PickedImageState {}

class Loaded extends PickedImageState {
  final PickedImage pickedImage;

  Loaded({required this.pickedImage});
}

class Error extends PickedImageState {
  final String message;

  Error({required this.message});
}
