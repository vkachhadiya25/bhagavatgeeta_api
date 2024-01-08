class HomeModel
{
     int? id,verses_count,chapter_number;
     String? name,slug,name_transliterated,name_translated,name_meaning,chapter_summary,chapter_summary_hindi;

     HomeModel(
      {this.id,
      this.verses_count,
      this.chapter_number,
      this.name,
      this.slug,
      this.name_transliterated,
      this.name_translated,
      this.name_meaning,
      this.chapter_summary,
      this.chapter_summary_hindi});

     factory HomeModel.mapToModel(Map m1)
     {
       return HomeModel(
         name: m1['name'],
         id: m1['id'],
         verses_count: m1['verses_count'],
         slug: m1['slug'],
         name_transliterated: m1['name_transliterated'] ,
         name_translated: m1['name_translated'],
         name_meaning: m1['name_meaning'],
         chapter_summary: m1['chapter_summary'],
         chapter_number: m1['chapter_number'],
         chapter_summary_hindi: m1['chapter_summary_hindi'],
       );
     }
}