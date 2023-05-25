import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/images/images.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/button/app_button.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/button/upload_scan_button.dart';
import 'package:pine_app/feature/widget/container/frosted_container.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/file/item_file.dart';
import 'package:pine_app/feature/widget/popup/feature_under_development.dart';
import 'package:pine_app/feature/widget/popup/show_sheet.dart';
import 'package:pine_app/feature/widget/popup/warning_remove_file.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/feature/widget/textfield/app_round_textfield.dart';
import 'package:pine_app/generated/l10n.dart';
import 'package:pine_app/core/util/string_utils.dart';

class CompanyDataScreen extends StatefulWidget {
  const CompanyDataScreen({super.key});

  @override
  State<CompanyDataScreen> createState() => _CompanyDataScreenState();
}

class _CompanyDataScreenState extends State<CompanyDataScreen> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _backupEmailAddressController =
      TextEditingController();

  final List<ItemCompanyLicense> _listItemCompanyLicense = [
    ItemCompanyLicense(
      label: S.current.companyName,
      controller: TextEditingController(text: 'Pinebank'),
    ),
    ItemCompanyLicense(
      label: S.current.businessActivity,
      controller: TextEditingController(text: 'Commercial bank'),
    ),
    ItemCompanyLicense(
      label: S.current.legalType,
      controller: TextEditingController(text: 'Limited Liability Company'),
    ),
    ItemCompanyLicense(
      label: S.current.numberLicense,
      controller: TextEditingController(text: '1234-5678-78-43'),
    ),
  ];
  List<File> listFile = [];
  List<String> listSize = [];
  List<String> listFileUpload = [];

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  Images.radiusBackground,
                  width: deviceWidth(context),
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Sz.i.s8),
                        child: const BuildBackButton(),
                      ),
                      const SpacingBox(h: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Sz.i.s24, vertical: Sz.i.s10),
                        child: Text(
                          S.current.companyData,
                          style: ptTitle4(context).copyWith(
                            fontSize: Sz.i.s24,
                            color: getColor(context).white,
                            height: 1.3,
                          ),
                        ),
                      ),
                      SpacingBox(h: Sz.i.s55),
                      _buildChangeTheCover(context)
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SpacingBox(h: 16),
                _buildNameInTheApplication(context),
                const SpacingBox(h: 24),
                _buildEmail(context),
                const SpacingBox(h: 24),
                _buildCompanyLicense(context),
                Padding(
                  padding: EdgeInsets.symmetric(
                          horizontal: Sz.i.s24, vertical: Sz.i.s16)
                      .copyWith(top: Sz.i.s8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.current.atachments,
                        style: ptBodyLargeBold(context).copyWith(
                          fontSize: Sz.i.s20,
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
                              showWarningRemoveFile(
                                  context, fileUpload.getShortString(30), () {
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
                      BuildUploadScanButton(
                        text: S.current.uploadFiles,
                        onTap: () {
                          showSheet(
                            context,
                            child: _showBottomSheet(
                              context,
                              title: S.current.unloadTheStatement,
                              subtitle:
                                  S.current.functionalityIsUnderDevelopment,
                              label: S.current.ok,
                              onTap: () {
                                showFeatureUnderDevelopment(context);
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyLicense(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s16)
          .copyWith(top: Sz.i.s8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                S.current.companyLicense,
                style: ptBodyLargeBold(context).copyWith(
                  fontSize: Sz.i.s20,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  showSheet(
                    context,
                    child: _showBottomSheet(
                      context,
                      title: S.current.changeYourLicense,
                      subtitle: S.current.toUpdateYourInformation,
                      label: S.current.scan,
                      onTap: () {
                        showFeatureUnderDevelopment(context);
                      },
                    ),
                  );
                },
                child: SvgPicture.asset(
                  AppIcons.editPencil,
                  width: Sz.i.s24,
                  height: Sz.i.s24,
                ),
              ),
            ],
          ),
          const SpacingBox(h: 24),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = _listItemCompanyLicense[index];
                return AppRoundTextField.label(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: Sz.i.s24, vertical: Sz.i.s16),
                  controller: item.controller,
                  keyboardType: TextInputType.text,
                  borderRadius: BorderRadius.circular(Sz.i.s20),
                  backgroundColor: getColor(context).white.withOpacity(0.7),
                  textInputAction: TextInputAction.none,
                  validation: (value) {
                    return '';
                  },
                  label: item.label,
                );
              },
              separatorBuilder: (context, index) {
                if (index == _listItemCompanyLicense.length - 1) {
                  return const SpacingBox();
                } else {
                  return const SpacingBox(h: 16);
                }
              },
              itemCount: _listItemCompanyLicense.length)
        ],
      ),
    );
  }

  Widget _showBottomSheet(BuildContext context,
      {required String title,
      required String subtitle,
      required String label,
      required void Function() onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SpacingBox(h: 40),
          Text(
            title,
            style: ptBodyLargeBold(context).copyWith(
              fontSize: Sz.i.s28,
              color: getColor(context).black,
            ),
          ),
          const SpacingBox(h: 24),
          Text(
            subtitle,
            style: ptBodyLargeThin(context)
                .copyWith(fontSize: Sz.i.s17, height: 1.4118),
          ),
          const SpacingBox(h: 24),
          AppButton.primary(
            onTap: onTap,
            label: label,
            forceUppercase: false,
            enabled: true,
          ),
          const SpacingBox(h: 24)
        ],
      ),
    );
  }

  Widget _buildNameInTheApplication(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s16)
          .copyWith(top: Sz.i.s8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.nameInTheApplication,
            style: ptBodyLargeBold(context).copyWith(
              fontSize: Sz.i.s20,
            ),
          ),
          const SpacingBox(h: 24),
          AppRoundTextField.label(
            contentPadding:
                EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s16),
            controller: _companyNameController,
            keyboardType: TextInputType.text,
            borderRadius: BorderRadius.circular(Sz.i.s20),
            backgroundColor: getColor(context).white.withOpacity(0.7),
            textInputAction: TextInputAction.none,
            enabled: true,
            validation: (value) {
              return '';
            },
            label: S.current.companyName,
          )
        ],
      ),
    );
  }

  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s16)
          .copyWith(top: Sz.i.s8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.email,
            style: ptBodyLargeBold(context).copyWith(
              fontSize: Sz.i.s20,
            ),
          ),
          const SpacingBox(h: 8),
          Text(
            S.current.allCompanyNewslettersReportsAndMessagesWillBeSent,
            style: ptBodyLargeThin(context).copyWith(
                fontSize: Sz.i.s14,
                height: 1.7143,
                color: getColor(context).white),
          ),
          const SpacingBox(h: 24),
          AppRoundTextField.label(
            contentPadding:
                EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s16),
            controller: _emailController,
            keyboardType: TextInputType.text,
            borderRadius: BorderRadius.circular(Sz.i.s20),
            backgroundColor: getColor(context).white.withOpacity(0.7),
            textInputAction: TextInputAction.none,
            enabled: true,
            validation: (value) {
              return '';
            },
            label: S.current.email,
          ),
          const SpacingBox(h: 16),
          AppRoundTextField(
              backgroundColor: getColor(context).white.withOpacity(0.7),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: Sz.i.s32, vertical: Sz.i.s16),
              controller: _backupEmailAddressController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.none,
              enabled: true,
              validation: (value) {
                return '';
              },
              hintText: S.current.backupEmailAddress),
          const SpacingBox(h: 10),
          Text(
            S.current.alternativeEmailAddress,
            style: ptBodyLargeThin(context).copyWith(
                fontSize: Sz.i.s14,
                height: 1.7143,
                color: getColor(context).white),
          )
        ],
      ),
    );
  }

  Widget _buildChangeTheCover(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Sz.i.s24),
      child: GestureDetector(
        onTap: () {
          showFeatureUnderDevelopment(context);
        },
        child: SizedBox(
          width: Sz.i.s220,
          child: FrostedContainer(
              blur: 0,
              bgColor: getColor(context).white.withOpacity(0.7),
              radius: Sz.i.s16,
              padding:
                  EdgeInsets.symmetric(horizontal: Sz.i.s8, vertical: Sz.i.s5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sz.i.s12),
                      color: getColor(context).iconGray,
                    ),
                    padding: EdgeInsets.all(Sz.i.s6),
                    child: SvgPicture.asset(
                      AppIcons.editPencil,
                      width: Sz.i.s24,
                      height: Sz.i.s24,
                      colorFilter: ColorFilter.mode(
                          getColor(context).gray1, BlendMode.srcIn),
                    ),
                  ),
                  const SpacingBox(w: 10),
                  Text(
                    S.current.changeCoverImage,
                    style: ptBodyLargeThin(context).copyWith(
                      fontSize: Sz.i.s15,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class ItemCompanyLicense {
  final String label;
  final TextEditingController controller;

  ItemCompanyLicense({required this.label, required this.controller});
}
