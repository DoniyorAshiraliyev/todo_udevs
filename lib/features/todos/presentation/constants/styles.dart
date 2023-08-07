import 'package:flutter/material.dart';

class Styles {
  static const Color c009fee = Color(0xff009fee);
  static const Color cfee8e9 = Color(0xfffee8e9);
  static const Color cee2b00 = Color(0xffee2b00);
  static const Color c999999 = Color(0xff999999);
  static const Color c7c7b7b = Color(0xff7c7b7b);

  /// ts - TextStyls, 14 - text fontsize, semiBold - fontweight
  static const TextStyle ts14semibold = TextStyle(
    fontSize: 14,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );
  static const TextStyle ts8regular = TextStyle(
    fontSize: 8,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
  );
  static const TextStyle ts26semibold = TextStyle(
    fontSize: 26,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
  );
  static const TextStyle ts14regular = TextStyle(
    fontSize: 14,

    /// Roboto family default in iOS
    fontWeight: FontWeight.w400,
  );
  static const TextStyle ts16regular = TextStyle(
    fontSize: 16,

    /// Roboto family default in iOS
    fontWeight: FontWeight.w400,
  );

  static const TextStyle ts10medium = TextStyle(
    fontSize: 10,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w500,
  );
}
