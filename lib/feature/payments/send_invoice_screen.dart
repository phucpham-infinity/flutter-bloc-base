import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';

import '../../core/theme/size.dart';
import '../../generated/l10n.dart';
import '../company_register/widget/list_document.dart';
import '../widget/button/app_expand_button.dart';
import '../widget/button/back_button.dart';

class SendInvoiceScreen extends StatefulWidget {
  const SendInvoiceScreen({super.key});

  @override
  State<SendInvoiceScreen> createState() => _SendInvoiceScreenState();
}

class _SendInvoiceScreenState extends State<SendInvoiceScreen> {
  List<String> listFileDownload = [
    'https://elearning.ntu.edu.vn/pluginfile.php/760409/mod_resource/content/0/De%20cuong%20CTHP_PTUD%20Web-62.CNTT.pdf',
  ];
  late String remotePDFpath;
  @override
  void initState() {
    super.initState();
    createFileOfPdfUrl().then((f) {
      setState(() {
        remotePDFpath = f.path;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      appBar: AppBar(
        leading: const BuildBackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 65,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacingBox(h: 38),
              Text(
                S.current.emailedToTheRecipient,
                style: ptButton(context).copyWith(
                    fontSize: Sz.i.s24, color: getColor(context).white),
              ),
              SpacingBox(h: 16),
              Text(
                S.current.youCanDownloadThisInvoice,
                style: ptBodyLargeThin(context).copyWith(
                    fontSize: Sz.i.s17, color: getColor(context).white),
              ),
              SpacingBox(h: 24),
              Text(
                S.current.downloadInvoice,
                style: ptButton(context).copyWith(
                    fontSize: Sz.i.s20, color: getColor(context).white),
              ),
              SpacingBox(h: 42),
              ListDocument(
                listFileDownload: listFileDownload,
              ),
              Spacer(),
              AppExpandButton.primary(
                  onTap: onSendEmail,
                  forceUppercase: false,
                  label: S.current.shareInvoice,
                  enabled: true),
              SpacingBox(h: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      final url = "http://www.pdf995.com/samples/pdf.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
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

  void onSendEmail() async {
    final Email email = Email(
        body: 'Email body',
        subject: 'Email subject',
        recipients: ['example@example.com'],
        attachmentPaths: [remotePDFpath]);
    await FlutterEmailSender.send(email);
  }
}
