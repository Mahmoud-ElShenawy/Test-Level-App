import 'package:test_level_project/model/designs_model.dart';

mixin DesignsRepositoryMixin {
  Future<List<DesignsModel>?> getData();

  Future updateDesign(DesignsModel model);

  Future createDesign(DesignsModel model);

  Future deleteDesign(int? id);

  Future<DesignsModel> getOneDesign(int? id);

  Future<List<DesignsModel>> getAllDesigns();
}
