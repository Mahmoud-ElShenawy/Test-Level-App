part of 'image_cubit.dart';

@immutable
abstract class ImageState extends Equatable {
  const ImageState();
}

/// There are two major states - Each state has a couple of another states to complete its cycle

/// First Major State :-
/// [CaptureImageInitial] is initial state for [ImageCubit]
/// [CaptureImageLoaded] holds image data when capture it
/// [CaptureImageLoading] is a loading state

/// Second Major State :-
/// [PickImageLoaded] holds image path of picked image

/// There is only one error state [ImageError]

@immutable
class CaptureImageInitial extends ImageState {
  @override
  List<Object> get props => [];
}

@immutable
class CaptureImageLoaded extends ImageState {
  final CaptureResultModel? image;

  const CaptureImageLoaded({
    required this.image,
  });

  @override
  List<Object> get props => [image!];
}

@immutable
class CaptureImageLoading extends ImageState {
  @override
  List<Object> get props => [];
}

// --------------------------------------------------------

@immutable
class PickImageLoaded extends ImageState {
  final String? imagePath;

  const PickImageLoaded(this.imagePath);

  @override
  List<Object> get props => [imagePath!];
}

// --------------------------------------------------------

@immutable
class ImageError extends ImageState {
  final String error;

  const ImageError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
