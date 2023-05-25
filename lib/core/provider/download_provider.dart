import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pine_app/feature/app.dart';

class FileDownloader extends ChangeNotifier {
  FileDownloader._privateConstructor();
  static final FileDownloader instance = FileDownloader._privateConstructor();

  String _localPath = '/storage/emulated/0/Download';
  List<String> downloadList = [];
  List<TaskInfo> _tasks = [];
  ReceivePort _port = ReceivePort();

  List<TaskInfo> get tasks => _tasks;
  String urlPDFPath = "";

  Future<File> createFileOfPdfUrl(String urlName) async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
      // final url = "https://pdfkit.org/docs/guide.pdf";
      print(urlName);
      final url = urlName.replaceAll('"', '');
      final filename = url.substring(url.lastIndexOf("/") + 1);
      print(url);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  Future<void> downloadFile(String url) async {
    final fileName = basename(url);
    for (var task in _tasks) {
      if (task.name == fileName) {
        await FlutterDownloader.remove(
            taskId: task.taskId, shouldDeleteContent: true);
      }
    }
    final res = await FlutterDownloader.enqueue(
      url: url,
      savedDir: _localPath,
      fileName: fileName,
      headers: {"auth": "download_file"},
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
      saveInPublicStorage: true,
    );
    print('Download result: $res');
    getExistingFiles();
  }

  Future<void> bindBackgroundIsolate() async {
    _prepareSaveDir();
    bool isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      unbindBackgroundIsolate();
      bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) async {
      String? id = data[0];
      int status = data[1] ?? 4; // 4 is DownloadTaskStatus.failed status
      int? progress = data[2];

      if (_tasks.isNotEmpty) {
        final task = _tasks.firstWhereOrNull((task) => task.taskId == id);
        task?.status = DownloadTaskStatus(status);
        task?.progress = progress;
        notifyListeners();
      }

      if (DownloadTaskStatus(status) == DownloadTaskStatus.complete) {
        getExistingFiles();
      }
    });
    await getExistingFiles();
    removeAllFiles();
  }

  Future<void> removeAllFiles() async {
    for (TaskInfo task in tasks) {
      FlutterDownloader.remove(taskId: task.taskId);
    }
    getExistingFiles();
  }

  Future<void> openFile(TaskInfo? task) async {
    final value = await FlutterDownloader.open(taskId: task?.taskId ?? '');
    if (!value) {
      FlutterDownloader.remove(
          taskId: task?.taskId ?? '', shouldDeleteContent: true);
      getExistingFiles();
    }
  }

  Future<void> getExistingFiles() async {
    final tasks = await FlutterDownloader.loadTasks();
    _tasks = (tasks?.map(
              (e) => TaskInfo(
                link: e.url,
                name: e.filename ?? '',
                taskId: e.taskId,
                status: e.status,
                progress: e.progress,
              ),
            ) ??
            [])
        .toList();
    print(tasks);
    notifyListeners();
  }

  void registerCallBack() {
    FlutterDownloader.registerCallback(callback);
  }

  @pragma('vm:entry-point')
  static void callback(String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status.value, progress]);
    // getExistingFiles();
  }

  void unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  void retryDownload(TaskInfo task) async {
    String? newTaskId = await FlutterDownloader.retry(taskId: task.taskId);
    task.taskId = newTaskId ?? task.taskId;
    notifyListeners();
    getExistingFiles();
  }

  Future<bool> checkPermissionDownload(TargetPlatform platform) async {
    if (Platform.isIOS) return true;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (platform == TargetPlatform.android &&
        androidInfo.version.sdkInt <= 28) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath())!;
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String?> _findLocalPath() async {
    var externalStorageDirPath;
    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } catch (e) {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }
}

class TaskInfo {
  final String name;
  final String link;
  String taskId;
  int? progress;
  DownloadTaskStatus? status;

  TaskInfo(
      {required this.name,
      required this.link,
      required this.taskId,
      this.progress = 0,
      this.status = DownloadTaskStatus.undefined});
}
