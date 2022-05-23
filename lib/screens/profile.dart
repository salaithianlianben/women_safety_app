import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save_me_applicationn/constants/constants.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<String, dynamic> hello = {
    "id": 1,
    "title": 1,
  };
  List<Map<String, dynamic>> listData = [
    {"id": 1, "title": "Trusted contacts", "icon": "assets/icons/handshake.png", "additional": ""},
    {"id": 2, "title": "SOS history", "icon": "assets/icons/history.png", "additional": ""},
    {"id": 3, "title": "Donation", "icon": "assets/icons/donation.png", "additional": ""},
    {"id": 4, "title": "Trusted by", "icon": "assets/icons/trust.png", "additional": ""},
    {"id": 5, "title": "Favorites", "icon": "assets/icons/Vector.png", "additional": ""},
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    List<ProfileFeatures> profileFeatures = listOfProfileFeatures(listData);
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: SingleChildScrollView(
          child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Icon(Icons.notifications_none_outlined)
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image(
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                          image: NetworkImage(
                              "https://www.nextbiography.com/wp-content/uploads/2022/01/Catriona-Gray-smile.jpg")),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Charlotte",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // color: mainColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            child: Text(
                              "Level 1.0",
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 1.5,
                ),
                itemCount: profileFeatures.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 90,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Image(image: AssetImage(profileFeatures[index].icon),height: 20,width: 20,),
                        Text(profileFeatures[index].title)
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )),
    ));
  }

  List<ProfileFeatures> listOfProfileFeatures(
      List<Map<String, dynamic>> mapList) {
    List<ProfileFeatures> tempList = [];
    mapList.forEach((value) {
      tempList.add(ProfileFeatures(
          id: value["id"], title: value["title"], icon: value["icon"]));
    });
    return tempList;
  }
}

class ProfileFeatures {
  final int id;
  final String title;
  final String icon;

  ProfileFeatures({
    required this.id,
    required this.title,
    required this.icon,
  });

  factory ProfileFeatures.fromJson(Map<String, dynamic> parsedJson) {
    return ProfileFeatures(
      id: parsedJson['id'],
      title: parsedJson['title'],
      icon: parsedJson['icon'],
    );
  }
}
