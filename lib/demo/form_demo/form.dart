import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
        elevation: 0.0,
      ),
      body: Theme(
        // data: ThemeData(
        //   primarySwatch: Colors.purple
        // ),
        data: Theme.of(context).copyWith(
          // textSelectionTheme: const TextSelectionThemeData(
          //   selectionColor: Colors.purple,              // 输入文字 选中颜色
          //   // selectionHandleColor: Colors.yellow,     
          //   cursorColor: Colors.blue                    // 输入框光标颜色
          // ),
          // inputDecorationTheme: const InputDecorationTheme(
          //   iconColor: Colors.green,
          //   labelStyle: TextStyle(
          //     color: Colors.green
          //   ),
          //   enabledBorder: UnderlineInputBorder(
          //     borderSide:BorderSide(color: Colors.green)
          //   ),
          //   focusedBorder: UnderlineInputBorder(
          //     borderSide:BorderSide(color: Colors.black)
          //   ),
          // )
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // TextFieldDemo()
              RegisterDemo()
            ],
          ),
        )
      )
    );
  }
}


class RegisterDemo extends StatefulWidget {
  const RegisterDemo({ Key? key }) : super(key: key);

  @override
  _RegisterDemoState createState() => _RegisterDemoState();
}

class _RegisterDemoState extends State<RegisterDemo> {

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  late String username, passwrod;

  AutovalidateMode _autovalidateMode = AutovalidateMode.onUserInteraction;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "username",
              helperText: ''
            ),
            validator: (value) {
              // RegExp pattern = RegExp(r'^\w{11}$');
              // if(!pattern.hasMatch(value!)) {  }
              if(value == null || value.isEmpty) {
                return 'username is required';
              }else {
                return null;
              }
            },
            onSaved: (value) {
              username = value!;
              debugPrint('username saved $username');
            },
            autovalidateMode: _autovalidateMode,
          ),
          const SizedBox(height: 16.0,),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "password",
              helperText: ''
            ),
            validator: (value) {
              if(value == null || value.isEmpty) {
                return 'password is required';
              }else {
                return null;
              }
            },
            onSaved: (value) {
              passwrod = value!;   
              debugPrint('password saved $passwrod');
            },
            autovalidateMode: _autovalidateMode,
          ),
          const SizedBox(height: 32.0,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text('Register', style: TextStyle(color: Colors.white),),
              onPressed: () {
                if((_registerFormKey.currentState as FormState).validate()) {
                  debugPrint('(_registerFormKey.currentState as FormState).save()  -->> before');
                  (_registerFormKey.currentState as FormState).save();
                  debugPrint('(_registerFormKey.currentState as FormState).save()  -->> after');
                  debugPrint('username: $username, password: $passwrod');

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('register...'))
                  );
                }else {
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });
                }
              }
            ),
          )
        ],
      )
    );
  }
}



class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({ Key? key }) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // _textEditingController.text = 'hello';
    _textEditingController.addListener(() { 
      debugPrint('input: ${_textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      // onChanged: (val) {
      //   debugPrint('change: $val');
      // },
      onSubmitted: (val) {
        debugPrint('submit: $val');
      },
      decoration: InputDecoration(
        icon: const Icon(Icons.subject),
        labelText: 'Text',
        hintText: 'Enter the post title',
        border: const OutlineInputBorder(),
        // border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
      ),
    );
  }
}