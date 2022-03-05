import 'package:test_level_project/model/designs_model.dart';

mixin DesignsMixin {
  Future getDesigns();

  Future deleteDesign(int? id);

  saveData(DesignsModel model);
}
