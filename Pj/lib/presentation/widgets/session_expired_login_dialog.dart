import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pj/app/extensions/color.dart';
import 'package:pj/presentation/pages/init/init_page.dart';

class SessionExpiredLoginDialog extends StatelessWidget {
  const SessionExpiredLoginDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Thông báo',
              style: GoogleFonts.raleway(
                textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: HexColor('783199'))
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Hết phiên đăng nhập.',
              style: GoogleFonts.raleway(
                textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: HexColor('464646'))
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              'Vui lòng đăng nhập lại.',
              style: GoogleFonts.raleway(
                textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: HexColor('464646'))
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 100.0,
                  height: 38.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.off(() => InitPage());
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0))
                      ),
                      elevation: 0.0,
                      backgroundColor: HexColor('5DD89D'),
                      textStyle: GoogleFonts.raleway(
                        textStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700, color: HexColor('FFFFFF'))
                      )
                    ),
                    child: const Text('Đồng ý')
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}