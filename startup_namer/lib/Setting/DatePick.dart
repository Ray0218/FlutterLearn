import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
// import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

import 'dart:async';

class DatePickerPage extends StatefulWidget {
  DatePickerPage({Key key}) : super(key: key);

  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime _nowDate = DateTime.now();

  TimeOfDay _nowTime = TimeOfDay.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
      //  locale: pr ,
    ).then((value) {
      print('then ==== ' + value.toString());

      if (value != null) {
        setState(() {
          _nowDate = value;
        });
      }
    });
//利用async获取异步数据
    // _showDatePickerAsy();
  }

  Future<void> _showDatePickerAsy() async {
    //利用async获取异步数据

    var result = await showTimePicker(context: context, initialTime: _nowTime);

    if (result != null) {
      setState(() {
        _nowTime = result;
      });
    }
  }

  void _showThirdDatePicker() {
    // DateTimePickerLocale _locale = DateTimePickerLocale.zh_cn;

    // DatePicker.showDatePicker(
    //   context,
    //   onMonthChangeStartWithFirstDate: true,
    //   // pickerTheme: DateTimePickerTheme(
    //   //     showTitle: true,
    //   //     confirm: Text('确定', style: TextStyle(color: Colors.red)),
    //   //     cancel: Text('取消')),
    //   minDateTime: DateTime.parse('2008-01-01'),
    //   maxDateTime: DateTime.parse('2022-12-30'),
    //   initialDateTime: _nowDate,
    //   dateFormat: 'yyyy-MMMM-dd EEE HH:mm:ss',
    //   pickerMode: DateTimePickerMode.datetime, // show TimePicker

    //   locale: _locale,
    //   onClose: () => print("----- onClose -----"),
    //   onCancel: () => print('onCancel'),
    //   onChange: (dateTime, List<int> index) {
    //     setState(() {
    //       _nowDate = dateTime;
    //     });
    //   },
    //   onConfirm: (dateTime, List<int> index) {
    //     setState(() {
    //       _nowDate = dateTime;
    //     });
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    print('当前日期' + DateTime.now().toString());

    print('日期转时间戳' + DateTime.now().millisecondsSinceEpoch.toString());

    print('时间戳转日期' +
        DateTime.fromMicrosecondsSinceEpoch(1594457100089).toString());

    print(formatDate(DateTime(1989, 2, 21), [yyyy, '年', mm, '月', dd]));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '当前时间' + formatDate(DateTime.now(), [yyyy, '年', mm, '月', dd]),
        ),
        SizedBox(
          height: 30,
        ),
        Text('系统日期组件'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(formatDate(_nowDate, [yyyy, '年', mm, '月', dd])),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: _showDatePicker,
            ),
            SizedBox(
              width: 15,
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(_nowTime.format(context)),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: _showDatePickerAsy,
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Text('第三方日期组件'),
        SizedBox(height: 10),
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_nowTime.format(context)),
              Icon(Icons.arrow_drop_down)
            ],
          ),
          onTap: _showThirdDatePicker,
        )
      ],
    );
  }
}
