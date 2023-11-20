import 'package:english_words/english_words.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WordPairAdapter extends TypeAdapter<WordPair> {
  @override
  final typeId = 0;

  @override
  WordPair read(BinaryReader reader) {
    return WordPair(reader.readString(), reader.readString());
  }

  @override
  void write(BinaryWriter writer, WordPair obj) {
    writer.writeString(obj.first);
    writer.writeString(obj.second);
  }
}
