import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/progress/loader.dart';

class FileUrlItem extends StatelessWidget {
  final String filename;
  final bool uploading;
  final Function()? onDownload;
  final Function()? onOpen;
  final Function()? onRetry;
  final Function()? onTap;
  final bool? isDownloading;
  final void Function()? onRemove;
  const FileUrlItem(
      {Key? key,
      required this.filename,
      this.onTap,
      this.uploading = false,
      this.onDownload,
      this.onRetry,
      this.onOpen,
      this.onRemove,
      this.isDownloading = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Sz.i.s14,
          horizontal: Sz.i.s16,
        ).copyWith(bottom: Sz.i.s28),
        decoration: BoxDecoration(
          color: getColor(context).white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(Sz.i.s20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppIcons.viennaSquircle,
              width: Sz.i.s32,
              height: Sz.i.s32,
            ),
            const Spacer(),
            Text(
              '№1_01_01',
              style: ptBodyLargeThin(context).copyWith(
                fontSize: Sz.i.s17,
                height: 1.4118,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
            const SpacingBox(h: 4),
            Text(
              'to 01 March',
              style: ptBodyLargeThin(context).copyWith(
                  fontSize: Sz.i.s12, color: getColor(context).textActive),
            ),
            if (isDownloading == true)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: Sz.i.s15,
                    width: Sz.i.s15,
                    child: kLoadingSpinner(context,
                        color: getColor(context).warning100),
                  ),
                ),
              )
            // else ...[
            //   if (onDownload != null)
            //     GestureDetector(
            //       behavior: HitTestBehavior.translucent,
            //       onTap: onDownload,
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: SvgPicture.asset(AppIcons.arrowLeft),
            //       ),
            //     ),
            //   if (onOpen != null)
            //     TextButton(
            //       onPressed: onOpen,
            //       child: Text(
            //         S.current.yes,
            //         style: ptLink(context),
            //       ),
            //     ),
            //   if (onRetry != null)
            //     GestureDetector(
            //       behavior: HitTestBehavior.translucent,
            //       onTap: onRetry,
            //       child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text(
            //             'Retry',
            //             style: ptLink(context)
            //                 .copyWith(color: getColor(context).warning500),
            //           )),
            //     ),
            // ],
          ],
        ),
      ),
    );
  }
}
