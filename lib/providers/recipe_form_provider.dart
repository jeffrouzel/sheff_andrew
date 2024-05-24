import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sheff_andrew/models/ingredient.dart';

class RecipeFormProvider extends ChangeNotifier {
  File? _recipeImage;
  File? _ingredientImage;
  final List<Ingredient> _ingredients = [];
  final TextEditingController _recipeNameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _timeToCookController = TextEditingController();
  final TextEditingController _mealTypeController = TextEditingController();

  // Getters
  File? get recipeImage => _recipeImage;
  File? get ingredientImage => _ingredientImage;
  List<Ingredient> get ingredients => _ingredients;
  TextEditingController get recipeNameController => _recipeNameController;
  TextEditingController get category => _categoryController;
  TextEditingController get timeToCook => _timeToCookController;
  TextEditingController get mealTypeController => _mealTypeController;

  void disposeControllers() {
    _recipeNameController.dispose();
    _categoryController.dispose();
    _timeToCookController.dispose();
    _mealTypeController.dispose();
  }

  void clearWholeForm() {
    _recipeImage = null;
    _recipeNameController.clear();
    _categoryController.clear();
    _timeToCookController.clear();
    notifyListeners();
  }

  Future setRecipePickedImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      _recipeImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  // Ingredients Dialog
  void clearIngredientImage() {
    _ingredientImage = null;
    notifyListeners();
  }

  void addIngredient(Ingredient ingredient) {
    _ingredients.add(ingredient);
    notifyListeners();
  }

  void removeIngredient(String label) {
    _ingredients.removeWhere((ingredient) => ingredient.label == label);
    notifyListeners();
  }

  Future setIngredientPickedImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      _ingredientImage = File(pickedFile.path);
      notifyListeners();
    }
  }
}
