import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/slRandomClor.dart';

import '../slRandomClor.dart';

class IconContainer extends StatelessWidget {
  final double size;
  final IconData icon;
  IconContainer(this.icon, {this.size = 22});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      color: slRandomColor(),
      child: Icon(
        this.icon,
        size: this.size,
        color: slRandomColor(),
      ),
    );
  }
}

class TestColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 600,
      color: Colors.lightBlue,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, //主轴 （）垂直方向
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconContainer(Icons.home),
            IconContainer(Icons.language),
            IconContainer(Icons.flag),
          ]),
    );
  }
}

class TestRow extends StatelessWidget {


  ScrollController _control = ScrollController() ; 
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(

      reverse: true,
      controller: _control,
  child: Column(
      children: [
        CupertinoFormSection(
          margin: EdgeInsets.all(10),
          header: Text('这个是header'),
          footer: Text('这个是footer'),
          decoration: BoxDecoration(
              color: Colors.white,
              // shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          children: [
            CupertinoFormRow(
              prefix: Text('prefix'),
              helper: Text('helper'),
              child: Text('content'),
              error: Text('this is error'),
            ),
            CupertinoTextFormFieldRow(
              initialValue: 'enter phone',
              placeholder: '请输入',
            )
          ],
        ),


        Autocomplete(optionsBuilder: (value ){
return Iterable.generate(5);
        })
      ],
    ),
    );
  }
}





class AutocompleteBasicExample extends StatelessWidget {
  
   final List<String> _kOptions = <String>[
     'aardvark',
     'bobcat',
     'chameleon',
   ];
 
   @override
   Widget build(BuildContext context) {
     return Column(

       children: [

         Autocomplete<String>(


   
       optionsBuilder: (TextEditingValue textEditingValue) {
         if (textEditingValue.text == '') {
           return const Iterable<String>.empty();
         }
         return _kOptions.where((String option) {
           return option.contains(textEditingValue.text.toLowerCase());
         });
       },
       onSelected: (String selection) {
         print('You just selected $selection');
       },
     ),

     Autocomplete<String>(


   
       optionsBuilder: (TextEditingValue textEditingValue) {
         if (textEditingValue.text == '') {
           return const Iterable<String>.empty();
         }
         return _kOptions.where((String option) {
           return option.contains(textEditingValue.text.toLowerCase());
         });
       },


fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
      
      
      return TextFormField(
        
      controller: textEditingController,
      focusNode: focusNode,
      onFieldSubmitted: (String value) {
        onFieldSubmitted();
      },

      decoration: InputDecoration(hintText: '请输入文字')
    );

},



       onSelected: (String selection) {
         print('You just selected $selection');
       },
     )
       ],
     );
   }
 }
 
 class User {


  const User({
     @required this.email,
     @required this.name,
   });
 
   final String email;
   final String name;
 
   @override
   String toString() {
     return '$name, $email';
   }
 
   @override
   bool operator ==(Object other) {
     if (other.runtimeType != runtimeType)
       return false;
     return other is User
         && other.name == name
         && other.email == email;
   }
 
   @override
   int get hashCode => hashValues(email, name);
 }
 
 class AutocompleteBasicUserExample extends StatelessWidget {
  
   static final List<User> _userOptions = <User>[
     User(name: 'Alice', email: 'alice@example.com'),
     User(name: 'Bob', email: 'bob@example.com'),
     User(name: 'Charlie', email: 'charlie123@gmail.com'),
   ];
 
   static String _displayStringForOption(User option) => option.name;
 
   @override
   Widget build(BuildContext context) {
     return Autocomplete<User>(
       displayStringForOption: _displayStringForOption,
       optionsBuilder: (TextEditingValue textEditingValue) {
         if (textEditingValue.text == '') {
           return const Iterable<User>.empty();
         }
         return _userOptions.where((User option) {
           return option.toString().contains(textEditingValue.text.toLowerCase());
         });
       },
       onSelected: (User selection) {
         print('You just selected ${_displayStringForOption(selection)}');
       },
     );
   }
 }