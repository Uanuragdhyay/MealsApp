import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/data/dummydata.dart';

final mealsProvider = Provider( (ref){
  return dummyMeals;
} );