import 'dart:io';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as Path;
import 'package:pine_app/core/util/string_utils.dart';


String? getMimeByMagicNumber(File file) {
  List<int> fileBytes = file.readAsBytesSync().toList();
  List<int> header = [];
  fileBytes.forEach((element) {
    if (element == 0) return;
    header.add(element);
  });

  return lookupMimeType(file.path, headerBytes: header) ??
      lookupMimeType(file.path);
}

enum FileType { document, image, video, gif }

class FileUtil {
  static String? getFileName(File file) {
    String fileName = file.path.split('/').last;
    return fileName.getShortString(20);
  }

  static String? getFileNameString(String fileName) {
    String n = fileName.split('/').last;
    return n.getShortString(25);
  }

  static FileType? getFbUrlFileType(String? path) {
    if (path == null) return null;

    if (path.toLowerCase().contains('.png') ||
        path.toLowerCase().contains('.jpg') ||
        path.toLowerCase().contains('.img') ||
        path.toLowerCase().contains('.jpeg') ||
        path.toLowerCase().contains('.webp')) return FileType.image;
    if (path.toLowerCase().contains('.mp4') || path.contains('.wmv'))
      return FileType.video;
    if (path.toLowerCase().contains('.doc')) return FileType.document;
    if (path.toLowerCase().contains('.gif')) return FileType.gif;
    return null;
  }

  static FileType? getFilePathType(String? path) {
    if (path == null) return null;

    if (Path.extension(path).toLowerCase() == '.png' ||
        Path.extension(path).toLowerCase() == '.jpg' ||
        Path.extension(path).toLowerCase() == '.img' ||
        Path.extension(path).toLowerCase() == '.jpeg' ||
        Path.extension(path).toLowerCase() == '.webp') return FileType.image;
    if (Path.extension(path).toLowerCase() == '.mp4' ||
        Path.extension(path).toLowerCase() == '.wmv') return FileType.video;
    if (Path.extension(path).toLowerCase() == '.doc') return FileType.document;
    if (Path.extension(path).toLowerCase() == '.gif') return FileType.gif;
    return null;
  }
}
