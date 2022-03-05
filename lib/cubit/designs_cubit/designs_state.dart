part of 'designs_cubit.dart';

@immutable
abstract class DesignsState extends Equatable {
  const DesignsState();
}

/// There are two major states - Each state has a couple of another states to complete its cycle

/// First Major State :-
/// [DesignsInitial] is initial state for [DesignsCubit]
/// [DesignsLoaded] holds designs data when retrieving it
/// [DesignsLoading] is a loading state
/// [DesignsError] is an Error state

/// Second Major State :-
/// [SaveDesign] holds data to store in local database

@immutable
class DesignsInitial extends DesignsState {
  @override
  List<Object> get props => [];
}

@immutable
class DesignsLoaded extends DesignsState {
  final List<DesignsModel>? designs;

  const DesignsLoaded({
    required this.designs,
  });

  @override
  List<Object> get props => [designs!];
}

@immutable
class DesignsError extends DesignsState {
  final String error;

  const DesignsError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

@immutable
class DesignsLoading extends DesignsState {
  @override
  List<Object> get props => [];
}

// --------------------------------------------------------

@immutable
class SaveDesign extends DesignsState {
  final Future? save;

  const SaveDesign(this.save);

  @override
  List<Object> get props => [save!];
}

@immutable
class SaveDesignLoaded extends DesignsState {
  const SaveDesignLoaded();

  @override
  List<Object> get props => [];
}
