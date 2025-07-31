import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class FilesUtils
{
  static Future<Directory> getAppFolder() async
  {
    return await getApplicationSupportDirectory();
  }

  static Future<void> createDB({required String path}) async {
    File file = File(path);
    bool isExist = await file.exists();
    if (isExist) return;

    await file.create(recursive: true);
    ByteData byteData = await rootBundle.load("assets/files/database_example.db");
    await file.writeAsBytes(byteData.buffer.asUint8List().toList());
  }
}