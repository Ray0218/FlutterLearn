import 'package:flutter/material.dart';

class StepView extends StatefulWidget {
  StepView({Key key}) : super(key: key);

  @override
  _StepViewState createState() => _StepViewState();
}

class _StepViewState extends State<StepView> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Theme(
                data: Theme.of(context).copyWith(primaryColor: Colors.purple),
                child: Stepper(
                    currentStep: _currentStep,
                    onStepTapped: (value) {
                      setState(() {
                        _currentStep = value;
                      });
                    },
                    onStepContinue: () {
                      setState(() {
                        _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                      });
                    },
                    onStepCancel: () {
                      setState(() {
                        _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                      });
                    },
                    steps: [
                      Step(
                          title: Text('步骤一'),
                          subtitle: Text('副标题'),
                          content: Text('ddf'),
                          isActive: _currentStep == 0),
                      Step(
                          title: Text('步骤二'),
                          subtitle: Text('副标题'),
                          content: Text('ddf'),
                          isActive: _currentStep == 1),
                      Step(
                          title: Text('步骤三'),
                          subtitle: Text('副标题'),
                          content: Text('ddf'),
                          isActive: _currentStep == 2)
                    ]))
          ],
        ),
      ),
    );
  }
}
