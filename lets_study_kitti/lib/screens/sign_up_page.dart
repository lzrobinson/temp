import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

const outlineColor = Color.fromARGB(100, 0, 0, 0);
const boxColor = Color.fromARGB(255, 254, 244, 225);
const boundarySize = 300.0;
const hOffset = 80.0;
const boxWidth = 250.0;
const boxHeight = 50.0;
const vOffset = 20.0;
const sectionFont = TextStyle(fontSize: 24);
const labelFont = TextStyle(fontSize: 16);
const linkFont = TextStyle(fontSize: 16, decoration: TextDecoration.underline);

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() {
    return _SignUpPageState();
  }
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(shrinkWrap: true, children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
              child: const Text("Let's Study Kitti",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
          ),
          Center(
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 2 * boundarySize,
                  child: Card(
                    elevation: 10,
                    child: SignUpElements(),
                  )))
        ]));
  }
}

class SignUpElements extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  SignUpElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FormBuilder(
          key: _formKey,
          child: ListView(shrinkWrap: true, children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    padding:
                        const EdgeInsets.fromLTRB(hOffset, 2 * vOffset, 0, 10),
                    child:
                        const Text('Create an account', style: sectionFont))),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: hOffset, vertical: vOffset),
              alignment: Alignment.centerLeft,
              child: Container(
                  height: boxHeight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: FormBuilderTextField(
                      cursorColor: Colors.black,
                      name: 'email',
                      decoration: const InputDecoration(
                        hintText: "email",
                        hintStyle: labelFont,
                        contentPadding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        border: InputBorder.none,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]))),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: hOffset, right: hOffset, bottom: vOffset),
              alignment: Alignment.centerLeft,
              child: Container(
                  height: boxHeight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: FormBuilderTextField(
                      cursorColor: Colors.black,
                      name: 'password',
                      decoration: const InputDecoration(
                        hintText: "password",
                        hintStyle: labelFont,
                        contentPadding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        border: InputBorder.none,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]))),
            ),
            Container(
                padding: const EdgeInsets.only(
                    left: hOffset, right: hOffset, bottom: vOffset),
                alignment: Alignment.centerLeft,
                child: Container(
                    height: boxHeight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.disabled,
                        cursorColor: Colors.black,
                        name: 'password_r',
                        decoration: const InputDecoration(
                          hintText: "confirm password",
                          hintStyle: labelFont,
                          contentPadding:
                              EdgeInsets.only(top: 5.0, bottom: 5.0),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value !=
                              _formKey.currentState!.fields['password']!.value
                                  .toString()) {
                            return 'Password is not matching';
                          }
                        }))),
            Container(
              padding: const EdgeInsets.only(
                  left: hOffset, right: hOffset, bottom: vOffset),
              alignment: Alignment.centerLeft,
              child: Container(
                  height: boxHeight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: FormBuilderTextField(
                      cursorColor: Colors.black,
                      name: 'name',
                      decoration: const InputDecoration(
                        hintText: "name",
                        hintStyle: labelFont,
                        contentPadding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        border: InputBorder.none,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]))),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: hOffset, right: hOffset, bottom: vOffset),
              alignment: Alignment.centerLeft,
              child: Container(
                  height: boxHeight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: FormBuilderTextField(
                      cursorColor: Colors.black,
                      name: 'major',
                      decoration: const InputDecoration(
                        hintText: "major",
                        hintStyle: labelFont,
                        contentPadding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        border: InputBorder.none,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]))),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  width: boxWidth,
                  padding: const EdgeInsets.only(bottom: 2 * vOffset),
                  child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 250, 172, 26),
                          border: Border.all(color: outlineColor)),
                      child: MaterialButton(
                          child: const Text("CREATE ACCOUNT",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          onPressed: () {
                            final validationSuccess =
                                _formKey.currentState!.validate();
                            if (validationSuccess == true) {
                              _formKey.currentState?.save();
                              debugPrint(
                                  _formKey.currentState?.value.toString());
                            } else {
                              debugPrint(
                                  _formKey.currentState?.value.toString());
                              debugPrint('validation failed');
                            }
                          })))
            ]),
          ]))
    ]);
  }
}
