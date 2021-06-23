import 'package:flutter/material.dart';

class EditUserTextField extends StatelessWidget {
  const EditUserTextField(
      {Key? key,
      required this.title,
      required this.value,
      required this.icon,
      required this.editable})
      : super(key: key);

  final String title;
  final String value;
  final Widget icon;
  final bool editable;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double hrwidth = queryData.size.width;
    double hrheight = queryData.size.height;
    return Container(
      margin: EdgeInsets.only(
          top: hrheight * 0.002, right: hrwidth * 0.042, left: hrwidth * 0.042),
      padding: EdgeInsets.all(10),
      width: hrwidth,
      height: 95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                height: 60,
                padding: EdgeInsets.all(0),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: TextEditingController.fromValue(TextEditingValue(
                      text: value,
                      selection:
                          TextSelection.collapsed(offset: value.length))),
                  textAlign: TextAlign.start,
                  enabled: editable,
                  enableInteractiveSelection: editable,
                  autofocus: false,
                  decoration: InputDecoration(
                    suffixIcon: icon,
                    labelStyle: TextStyle(color: Colors.white),
                    // contentPadding: EdgeInsets.only(bottom: 20),
                    // filled: true,
                    fillColor: Colors.red,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.5, color: Colors.grey)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 0.5,
                      color: Colors.grey,
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 0.5,
                      color: Colors.grey,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 0.5,
                      color: Colors.grey,
                    )),
                  ),
                  style: (editable)
                      ? Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16)
                      : Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16, color: Color(0xff919191)),
                  onChanged: (text) {
                    print(text);
                  },
                )),
          ),
        ],
      ),
    );
  }
}
