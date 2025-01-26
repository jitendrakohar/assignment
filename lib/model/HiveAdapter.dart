import 'package:hive/hive.dart';
import 'post_model.dart';

class PostModelAdapter extends TypeAdapter<PostModel> {
  @override
  final int typeId = 0; // Ensure this ID is unique across your adapters.

  @override
  PostModel read(BinaryReader reader) {
    return PostModel(
      id: reader.readInt(),
      createdAt: reader.readString(),
      createdAtInMillis: reader.readInt(),
      imageMedium: reader.readString(),
      commentsCount: reader.readInt(),
      store: reader.readBool() ? Store(name: reader.readString()) : null,
    );
  }

  @override
  void write(BinaryWriter writer, PostModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.createdAt);
    writer.writeInt(obj.createdAtInMillis);
    writer.writeString(obj.imageMedium);
    writer.writeInt(obj.commentsCount);
    writer.writeBool(obj.store != null);
    if (obj.store != null) {
      writer.writeString(obj.store!.name);
    }
  }
}

class StoreAdapter extends TypeAdapter<Store> {
  @override
  final int typeId = 1;

  @override
  Store read(BinaryReader reader) {
    return Store(name: reader.readString());
  }

  @override
  void write(BinaryWriter writer, Store obj) {
    writer.writeString(obj.name);
  }
}
