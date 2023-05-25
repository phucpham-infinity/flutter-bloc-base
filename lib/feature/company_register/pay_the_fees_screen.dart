import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/core/util/string_utils.dart';
import 'package:pine_app/feature/company_register/sign_the_documents_screen.dart';
import 'package:pine_app/feature/company_register/widget/list_document.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/button/upload_scan_button.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/file/item_file.dart';
import 'package:pine_app/feature/widget/popup/warning_remove_file.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/generated/l10n.dart';

class PayTheFeesScreen extends StatefulWidget {
  const PayTheFeesScreen({super.key});

  @override
  State<PayTheFeesScreen> createState() => _PayTheFeesScreenState();
}

class _PayTheFeesScreenState extends State<PayTheFeesScreen> {
  List<File> listFile = [];
  List<String> listSize = [];
  List<String> listFileUpload = [];

  List<String> listFileDownload = [
    'https://elearning.ntu.edu.vn/pluginfile.php/760409/mod_resource/content/0/De%20cuong%20CTHP_PTUD%20Web-62.CNTT.pdf',
    'https://elearning.ntu.edu.vn/pluginfile.php/760404/mod_resource/content/0/Chu%20de%201%20-%20Tong%20Quan.pdf',
    'https://elearning.ntu.edu.vn/pluginfile.php/760405/mod_resource/content/0/Chu%20de%202%20-%20Controllers.pdf'
  ];

  bool get _enable => listFile.isNotEmpty;
  String tempPath = '';
  Future _pickeFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      setState(() {
        listFile = files;
        listSize = files.map((e) {
          return StringUtil(e.path).getFileSize(e);
        }).toList();
      });
      listFileUpload = listFile.map((e) {
        return e.path;
      }).toList();
    } else {
      print('cc');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: Sz.i.s8),
                      child: const BuildBackButton(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SpacingBox(h: 12),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BuildTitleWithSub(
                                  title: S.current.payTheFees,
                                  sub: S
                                      .current.weHaveSentYouyAPaymentLinkEmail),
                              const SpacingBox(h: 24),
                              _buildDocsForPay(context),
                            ],
                          ),
                        ),
                        if (listFile.isNotEmpty)
                          _buildGeneralInformation(context)
                        else
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                            child: Column(
                              children: [
                                const SpacingBox(h: 24),
                                _buildPaymentReceipts(context),
                                const SpacingBox(h: 24),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Sz.i.s24).copyWith(top: 0),
              child: AppExpandButton.primary(
                onTap: () => navigateTo(SignTheDocumentsScreen()),
                buttonStyle: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        getColor(context).primaryLightHover)),
                enabled: _enable,
                label: S.current.send,
                forceUppercase: false,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGeneralInformation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SpacingBox(h: 24),
        Padding(
          padding: EdgeInsets.all(Sz.i.s24).copyWith(top: Sz.i.s8),
          child: Text(
            S.current.generalInformation,
            style: ptBodyLargeBold(context).copyWith(
              fontSize: Sz.i.s20,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listFile.length,
          itemBuilder: (context, index) {
            final file = listFile[index];
            final size = listSize[index];
            final fileUpload = listFileUpload[index];

            return BuildItemFile(
              file: file,
              size: size,
              fileUpload: fileUpload,
              onRemove: () {
                showWarningRemoveFile(context, fileUpload.getShortString(30),
                    () {
                  setState(() {
                    listFile.removeAt(index);
                    listSize.removeAt(index);
                  });
                  Navigator.pop(context);
                });
              },
            );
          },
        ),
        SpacingBox(h: 35),
      ],
    );
  }

  Widget _buildPaymentReceipts(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Sz.i.s8, bottom: Sz.i.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.attachPaymentConfirmation,
            style: ptBodyLargeBold(context).copyWith(
              fontSize: Sz.i.s20,
            ),
          ),
          const SpacingBox(h: 24),
          BuildUploadScanButton(
            text: S.current.uploadPaymentConfirmation,
            onTap: _pickeFile,
          ),
          const SpacingBox(h: 24),
        ],
      ),
    );
  }

  Widget _buildDocsForPay(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Sz.i.s8, bottom: Sz.i.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.paymentDocuments,
            style: ptBodyLargeBold(context).copyWith(
              fontSize: Sz.i.s20,
            ),
          ),
          const SpacingBox(h: 24),
          ListDocument(
            listFileDownload: listFileDownload,
          )
        ],
      ),
    );
  }
}
