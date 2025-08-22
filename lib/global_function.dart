import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

DataColumn2 customDataColumn(
    title, TextAlign textAlign, double? fontSize, double? width, {int?maxLine}) {
  return DataColumn2(
    label: SizedBox(
      width: double.infinity,
      child: Text(
        maxLines: maxLine,
        title,
        textAlign: textAlign,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: fontSize,
        ),
      ),
    ),
    fixedWidth: width,
    // columnWidth: CustomColumnWidth(40.0, 20.0),
    // fixedWidth: 120,
  );
}

DataColumn2 customDataColumnFunc(
    title, TextAlign textAlign, double? fontSize, double? width, func) {
  return DataColumn2(
    label: SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: func,
        child: Text(
          title,
          textAlign: textAlign,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: fontSize,
          ),
        ),
      ),
    ),
    fixedWidth: width,
    // columnWidth: CustomColumnWidth(40.0, 20.0),
    // fixedWidth: 120,
  );
}