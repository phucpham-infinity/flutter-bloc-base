import 'dart:io';

import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:pine_app/core/theme/icons/icons.dart';

// ignore: constant_identifier_names
enum MimeType { DOC, PDF, EXCEL, JPG, PNG, ZIP, TXT, TIFF, SVG, PPT, OGG, MP4 }

MimeType getMimeTypeEnum(File file) {
  final mime = lookupMimeType(file.path);
  return getMimeTypeFromPath(mime);
}

MimeType getMimeTypeFromPath(String? path) {
  final mime = lookupMimeType(path ?? '');
  
  switch (mime?.toLowerCase()) {
    case 'image/jpeg':
    case 'image/jpg':
      return MimeType.JPG;
    case 'image/png':
      return MimeType.PNG;
    case 'audio/ogg':
      return MimeType.OGG;
    case 'application/pdf':
      return MimeType.PDF;
    case 'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
    case 'application/doc':
    case 'application/docx':
      return MimeType.DOC;
    case 'application/zip':
      return MimeType.ZIP;
    case 'video/mp4':
      return MimeType.MP4;
    case 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':
    case 'application/xlsx':
    case 'application/xls':
      return MimeType.EXCEL;
    case 'application/vnd.openxmlformats-officedocument.presentationml.presentation':
    case 'application/ppt':
    case 'application/pptx':
      return MimeType.PPT;
    case 'text/plain':
      return MimeType.TXT;
    case 'image/tiff':
      return MimeType.TIFF;
    default:
      return MimeType.PNG;
  }
}

extension MimeTypeExtension on MimeType {
  String getIcon() {
    switch (this) {
      case MimeType.DOC:
        return AppIcons.fileDocument;
      case MimeType.PDF:
        return AppIcons.fileDocument;
      case MimeType.EXCEL:
        return AppIcons.fileDocument;
      case MimeType.JPG:
        return AppIcons.mediaImage;
      case MimeType.PNG:
        return AppIcons.mediaImage;
      case MimeType.ZIP:
        return AppIcons.fileDocument;
      case MimeType.TXT:
        return AppIcons.fileDocument;
      case MimeType.TIFF:
        return AppIcons.mediaImage;
      case MimeType.SVG:
        return AppIcons.mediaImage;
      case MimeType.PPT:
        return AppIcons.fileDocument;
      case MimeType.OGG:
        return AppIcons.mediaImage;
      case MimeType.MP4:
        return AppIcons.mediaImage;
    }
  }
}

String getFileName(File file) {
  String name = basename(file.path);
  if (name.length > 30) {
    name = name.substring(0, 10) + '...' + name.substring(name.length - 15);
  }
  return name;
}
