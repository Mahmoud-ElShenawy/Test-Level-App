import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_level_project/cubit/designs_cubit/designs_mixin.dart';
import 'package:test_level_project/di/di_imports.dart';
import 'package:test_level_project/model/designs_model.dart';
import 'package:test_level_project/repository/designs_repository.dart';
import 'package:injectable/injectable.dart';

part 'designs_state.dart';

@injectable
class DesignsCubit extends Cubit<DesignsState> with DesignsMixin {
  final DesignsRepository _repository;
  List<DesignsModel>? _designs;

  DesignsCubit(this._repository) : super(DesignsInitial()) {
    getDesigns();
  }

  @override
  Future getDesigns() async {
    try {
      emit(DesignsLoading());
      _designs = await _repository.getData();
      emit(DesignsLoaded(designs: _designs));
    } catch (e) {
      logger.e('Error to Get Data from Local DB: ${e.toString()}');
      emit(const DesignsError(error: 'Sorry, Something wrong is happened'));
    }
  }

  @override
  Future deleteDesign(int? id) async {
    try {
      emit(DesignsLoading());
      await _repository.deleteDesign(id);
      _designs!.removeWhere((element) => element.id == id);
      emit(DesignsLoaded(designs: _designs));
    } catch (e) {
      logger.e(
          'Error to Delete Data (ID: $id) from Local DB: ${e.toString()} - $_designs');
      emit(const DesignsError(error: 'Sorry, Something wrong is happened'));
    }
  }

  @override
  saveData(DesignsModel model) {
    emit(
      SaveDesign(
        _repository.createDesign(model).then((value) => getDesigns())
      ),
    );
    emit(const SaveDesignLoaded());
  }
}
