import 'package:flutter/material.dart';

import 'package:technicalInterview/getThing/models/User.dart';
import '../services/get_user_service.dart';

class GetUser extends StatefulWidget {
  GetUser({Key key}) : super(key: key);

  @override
  _GetUserState createState() => _GetUserState();
}

class _GetUserState extends State<GetUser> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: UserService().getUsers(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            List<User> users = snapshot.data;

            return Container(
              width: size.width,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: users.map((User user) {
                  return Card(
                    elevation: 5,
                    child: Container(
                      width: size.width * .5,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(user.id + ' '),
                          //ok di gumagana imageUrl
                          //   Image.network(user.imageUrl),
                          Text(user.name),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          } else {
            return _loading();
          }
        },
      ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
