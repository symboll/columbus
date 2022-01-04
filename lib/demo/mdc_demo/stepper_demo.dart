
import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  const StepperDemo({ Key? key }) : super(key: key);

  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  void _stepTapped (int value) {
    setState(() {
      _currentStep = value;
    });
  }
  void _stepContinue () {
    setState(() {
      _currentStep < 2 ? _currentStep++ : _currentStep = 0;
    });
  }
  void _stepCancel () {
    setState(() {
      _currentStep > 0 ? _currentStep-- : _currentStep = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StepperDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black,
              ), 
              child: Stepper(
                currentStep: _currentStep,
                onStepContinue: _stepContinue,
                onStepTapped: _stepTapped,
                onStepCancel: _stepCancel,
                steps: [
                  Step(
                    title: Text('Login'), 
                    subtitle: Text('Login first'),
                    content: Text('ashjkd shdjkash askh dkhjas dashjdas '),
                    isActive: _currentStep == 0
                  ),
                  Step(
                    title: Text('Choose Plan'), 
                    subtitle: Text('Choose your plan'),
                    content: Text('ashjkd shdjkash askh dkhjas dashjdas '),
                    isActive: _currentStep == 1
                  ),
                  Step(
                    title: Text('Confirm Payment'), 
                    subtitle: Text('Confirm your payment method.'),
                    content: Text('ashjkd shdjkash askh dkhjas dashjdas '),
                    isActive: _currentStep == 2
                  )
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}
