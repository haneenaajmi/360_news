import 'package:news_app_360/models/slider_model.dart';

List<SliderModel> getSliders() {
  List<SliderModel> slider = [];
  SliderModel categoryModel = new SliderModel();

  categoryModel.image = "images/business.jpg";
  categoryModel.name = "Bow to the Authority of silenforce";
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  categoryModel.image = "images/entertainment.jpg";
  categoryModel.name = "Bow to the Authority of silenforce";
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  categoryModel.image = "images/general.jpg";
  categoryModel.name = "Bow to the Authority of silenforce";
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  categoryModel.image = "images/health.jpg";
  categoryModel.name = "Bow to the Authority of silenforce";
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  categoryModel.image = "images/sports.jpg";
  categoryModel.name = "Bow to the Authority of silenforce";
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  return slider;
}
