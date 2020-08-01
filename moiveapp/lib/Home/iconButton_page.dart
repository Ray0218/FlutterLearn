import 'package:flutter/material.dart';

class IconButtonsPage extends StatefulWidget {
  IconButtonsPage({Key key}) : super(key: key);

  @override
  _IconButtonsPageState createState() => _IconButtonsPageState();
}

class _IconButtonsPageState extends State<IconButtonsPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CustomerButton(
          title: '相机',
          iconData: Icons.camera_alt,
        ),
        CustomerButton(
          title: '手写',
          iconData: Icons.ac_unit,
        ),
        CustomerButton(
          title: '对话',
          iconData: Icons.keyboard_voice,
        ),
        CustomerButton(
          title: '语音',
          iconData: Icons.settings_voice,
        ),
 
         
      ],
    );
  }
}

class CustomerButton extends StatefulWidget {
  final String title;
  final IconData iconData;
  final String imageData;

  CustomerButton({Key key, @required this.title, this.iconData, this.imageData})
      : super(key: key);

  @override
  _CustomerButtonState createState() => _CustomerButtonState();
}

class _CustomerButtonState extends State<CustomerButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: <Widget>[
          _disPlayIcon(),

          Divider(height: 20,),
          Text(
            widget.title,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.justify,
          )
        ],
      ),
      onTap: () {
        
      },
    );
  }

  Widget _disPlayIcon() {
    if (widget.iconData != null) {
      return Icon(
        widget.iconData,
        color: Color(0xff3f51B5),
      );
    } else if (widget.imageData != null) {
      return ImageIcon(NetworkImage(widget.imageData));
    } else {
      return Container();
    }
  }
}
