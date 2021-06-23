import 'package:flutter/material.dart';

import '../../../../utilities/colors.dart';
import 'ImageContainer.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          ImageContainer(),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 295),
            child: Text(
              "Description",
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 13, height: 1.5),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 310),
            child: Text(
              "Read more",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 14, color: AppColors.purple),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 160,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1569336415962-a4bd9f69cd83?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=889&q=80',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30.0,
              top: 40.0,
            ),
            child: Container(
              width: 750.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.purple,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 150.0, top: 15.0),
                child: Text(
                  "Submit",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
