import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../models/article_model.dart';
import '../models/quiz_model.dart';

class LocalDataService {
  Future<List<ArticleModel>> loadArticles() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/articles.json');
      final List<dynamic> jsonResponse = json.decode(jsonString);
      return jsonResponse.map((data) => ArticleModel.fromJson(data)).toList();
    } catch (e) {
      debugPrint('Error loading articles: $e');
      return [];
    }
  }

  Future<List<QuizModel>> loadQuizzes() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/quizzes.json');
      final List<dynamic> jsonResponse = json.decode(jsonString);
      return jsonResponse.map((data) => QuizModel.fromJson(data)).toList();
    } catch (e) {
      debugPrint('Error loading quizzes: $e');
      return [];
    }
  }
}
