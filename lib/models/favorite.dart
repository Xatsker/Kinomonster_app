import 'package:flutter/material.dart';

class FavoritesStore extends ChangeNotifier{

  List<int> get favoritIDs => List.from(_favor);

  List<int> _favor = [];
  addMovie(int id){
    if (!_favor.contains(id)) _favor.add(id);
    notifyListeners();
  }

  removeMovie(int id){
    if (_favor.contains(id)) _favor.remove(id);
    notifyListeners();
  }

  bool isFavorite(int id) => _favor.contains(id);
}