import 'package:flutter/material.dart';

class EditUserTextField extends StatelessWidget {
 
  const EditUserTextField({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.editable
  }) : super(key: key);

  final String title;
  final String value;
  final Widget icon;
  final bool editable;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double hrwidth = queryData.size.width;
    double hrheight =  queryData.size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: hrheight*0.008, horizontal: hrwidth*0.042),
       padding: EdgeInsets.all(10),
       width: hrwidth,
       height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 3),
              child: Text(
               title,
                style: (editable) ? Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 16, 
                              fontWeight: FontWeight.bold
                ):Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 16, 
                              fontWeight: FontWeight.bold,
                              color: Color(0xff818181)
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 40,
              padding: EdgeInsets.all(0),
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                controller: TextEditingController.fromValue(TextEditingValue(text: value, selection: TextSelection.collapsed(offset: value.length))),
                textAlign: TextAlign.start,
                enabled: editable,
                enableInteractiveSelection: editable,
                autofocus: false,
                decoration: InputDecoration(
                  suffixIcon: icon,
                  labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.only(bottom: 20),
                    fillColor: Color(0xff1a1a1a).withOpacity(0),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.white
                      )
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.white,
                      )
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.white,
                      )
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.white,
                      )
                    ),
                  ),
                  style: (editable) ? Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16
                  ): Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16,
                    color: Color(0xff818181)
                  ),
                  onChanged: (text){
                    print(text);
                  },
              )
            ),
          ),
        ],
      ),
    );
  }
}
