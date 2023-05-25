import 'dart:io';

import 'package:mime/mime.dart';
import 'package:pine_app/core/util/file_utils.dart';

enum MimeType {
  IMAGE_PNG,
  IMAGE_JPEG,
  IMAGE_GIF,
  VIDEO_MP4,
  AUDIO_MP3,
  AUDIO_MPEG,
  AUDIO_OGG,
  APPLICATION_PDF,
  APPLICATION_MSWORD,
}

extension MimeTypeExtension on MimeType? {
  String get value {
    if (this == null) return 'IMAGE_JPEG';
    return this.toString().split('.').last;
  }

  bool get isImage {
    if ([MimeType.IMAGE_PNG, MimeType.IMAGE_JPEG, MimeType.IMAGE_GIF]
        .contains(this)) {
      return true;
    }
    return false;
  }

  bool get isVideo {
    if ([MimeType.VIDEO_MP4, MimeType.AUDIO_MPEG, MimeType.AUDIO_OGG]
        .contains(this)) {
      return true;
    }
    return false;
  }

  bool get isDoc {
    if ([MimeType.APPLICATION_PDF, MimeType.APPLICATION_MSWORD]
        .contains(this)) {
      return true;
    }
    return false;
  }
}

MimeType fromMimeTypeValue(String? value) {
  for (int i = 0; i < MimeType.values.length; i++) {
    final element = MimeType.values[i];
    if (element.value == value) {
      return element;
    }
  }
  return MimeType.IMAGE_PNG;
}

MimeType getMimeTypeEnum(String path) {
  final mime = getMimeByMagicNumber(File(path));

  switch (mime?.toLowerCase()) {
    case 'image/jpeg':
      return MimeType.IMAGE_JPEG;
    case 'image/png':
      return MimeType.IMAGE_PNG;
    case 'image/gif':
      return MimeType.IMAGE_GIF;
    case 'audio/mp3':
      return MimeType.AUDIO_MP3;
    case 'video/mp4':
      return MimeType.VIDEO_MP4;
    case 'audio/mpeg':
      return MimeType.AUDIO_MPEG;
    case 'audio/ogg':
      return MimeType.AUDIO_OGG;
    case 'application/pdf':
      return MimeType.APPLICATION_PDF;
    case 'application/msword':
      return MimeType.APPLICATION_MSWORD;
    default:
      return MimeType.IMAGE_JPEG;
  }
}

MimeType getMimeTypeEnumFromUrl(String url) {
  final mime = lookupMimeType(url);

  switch (mime?.toLowerCase()) {
    case 'image/jpeg':
      return MimeType.IMAGE_JPEG;
    case 'image/png':
      return MimeType.IMAGE_PNG;
    case 'image/gif':
      return MimeType.IMAGE_GIF;
    case 'audio/mp3':
      return MimeType.AUDIO_MP3;
    case 'video/mp4':
      return MimeType.VIDEO_MP4;
    case 'audio/mpeg':
      return MimeType.AUDIO_MPEG;
    case 'audio/ogg':
      return MimeType.AUDIO_OGG;
    case 'application/pdf':
      return MimeType.APPLICATION_PDF;
    default:
      return MimeType.IMAGE_JPEG;
  }
}

MimeType fromStringToMimeType(String mime) {
  switch (mime.toLowerCase()) {
    case 'image/jpeg':
      return MimeType.IMAGE_JPEG;
    case 'image/png':
      return MimeType.IMAGE_PNG;
    case 'image/gif':
      return MimeType.IMAGE_GIF;
    case 'audio/mp3':
      return MimeType.AUDIO_MP3;
    case 'video/mp4':
      return MimeType.VIDEO_MP4;
    case 'audio/mpeg':
      return MimeType.AUDIO_MPEG;
    case 'audio/ogg':
      return MimeType.AUDIO_OGG;
    case 'application/pdf':
      return MimeType.APPLICATION_PDF;
    default:
      return MimeType.IMAGE_JPEG;
  }
}
