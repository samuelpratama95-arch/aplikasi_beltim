class QuestionModel {
  final String id;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuestionModel({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'] as String,
      question: json['question'] as String,
      options: List<String>.from(json['options'] as List),
      correctAnswerIndex: json['correctAnswerIndex'] as int,
    );
  }
}

class QuizModel {
  final String id;
  final String title;
  final String rating;
  final String imageUrl;
  final List<QuestionModel> questions;

  QuizModel({
    required this.id,
    required this.title,
    required this.rating,
    required this.imageUrl,
    required this.questions,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      id: json['id'] as String,
      title: json['title'] as String,
      rating: json['rating'] as String,
      imageUrl: json['imageUrl'] as String,
      questions: (json['questions'] as List)
          .map((q) => QuestionModel.fromJson(q as Map<String, dynamic>))
          .toList(),
    );
  }
}
