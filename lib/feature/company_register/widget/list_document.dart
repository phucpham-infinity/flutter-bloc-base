import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:pine_app/core/provider/download_provider.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/app.dart';
import 'package:pine_app/feature/company_register/widget/file_url_item.dart';
import 'package:pine_app/feature/widget/pdf/view_pdf.dart';
import 'package:provider/provider.dart';

class ListDocument extends StatefulWidget {
  final List<String> listFileDownload;
  const ListDocument({super.key, required this.listFileDownload});

  @override
  State<ListDocument> createState() => _ListDocumentState();
}

class _ListDocumentState extends State<ListDocument> {
  FileDownloader _fileDownloader = FileDownloader.instance;

  @override
  void didChangeDependencies() {
    _fileDownloader = Provider.of<FileDownloader>(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    _fileDownloader.getExistingFiles();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: Sz.i.s16,
            crossAxisSpacing: Sz.i.s16,
            childAspectRatio: 1.1567),
        itemCount: widget.listFileDownload.length,
        itemBuilder: (context, index) {
          final task = _fileDownloader.tasks.firstWhereOrNull(
              (element) => element.name == widget.listFileDownload[index]);
          return FileUrlItem(
              filename: widget.listFileDownload[index],
              onTap: () {
                navigateTo(ViewPDF());
                // _fileDownloader.openFile(task);
                // _fileDownloader
                //     .checkPermissionDownload(Theme.of(context).platform);
                // _fileDownloader.downloadFile(
                //   widget.listFileDownload[index],
                // );
                // setState(() {});
              },
              isDownloading: (task?.status == DownloadTaskStatus.enqueued ||
                  task?.status == DownloadTaskStatus.running),
              onOpen: (task?.status == DownloadTaskStatus.complete)
                  ? () {
                      _fileDownloader.openFile(task!);
                    }
                  : null,
              onRetry: (task?.status == DownloadTaskStatus.failed)
                  ? () {
                      _fileDownloader.retryDownload(task!);
                    }
                  : null,
              onDownload: (task == null ||
                      task.status == DownloadTaskStatus.undefined)
                  ? () {
                      _fileDownloader
                          .checkPermissionDownload(Theme.of(context).platform);
                      _fileDownloader.downloadFile(
                        widget.listFileDownload[index],
                      );
                      setState(() {});
                    }
                  : null);
        });
  }
}
