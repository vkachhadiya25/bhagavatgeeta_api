class ShlokModel {
  int? id, verse_number, chapter_number;
  String? slug, text, transliteration, word_meanings;
  List<TranslationsModel>? translationsList = [];
  List<CommentariesModel>? commentariesList = [];

  ShlokModel(
      {this.id,
      this.verse_number,
      this.chapter_number,
      this.slug,
      this.text,
      this.transliteration,
      this.word_meanings,
      this.translationsList,
      this.commentariesList});

  factory ShlokModel.mapToModel(Map m1) {
    List l1 = m1['translations'];
    List l2 = m1['commentaries'];
    return ShlokModel(
      id: m1['id'],
      chapter_number: m1['chapter_number'],
      slug: m1['slug'],
      text: m1['text'],
      transliteration: m1['transliteration'],
      verse_number: m1['verse_number'],
      word_meanings: m1['word_meanings'],
      commentariesList: l2.map((e) => CommentariesModel.mapToModel(e)).toList(),
      translationsList: l1.map((e) => TranslationsModel.mapToModel(e)).toList(),
    );
  }
}

class TranslationsModel {
  int? id;
  String? description, author_name, language;

  TranslationsModel(
      {this.id, this.description, this.author_name, this.language});

  factory TranslationsModel.mapToModel(Map m1) {
    return TranslationsModel(
      id: m1['id'],
      description: m1['description'],
      author_name: m1['author_name'],
      language: m1['language'],
    );
  }
}

class CommentariesModel {
  int? id;
  String? description, author_name, language;

  CommentariesModel(
      {this.id, this.description, this.author_name, this.language});

  factory CommentariesModel.mapToModel(Map m1) {
    return CommentariesModel(
      id: m1['id'],
      description: m1['description'],
      author_name: m1['author_name'],
      language: m1['language'],
    );
  }
}
