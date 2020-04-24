import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:training_diet/model/meal.dart';
import 'package:training_diet/ui/pages/widgets/ingredient_progress.dart';
import 'package:training_diet/ui/pages/widgets/meal_card.dart';
import 'package:training_diet/ui/pages/widgets/radial_progress.dart';
import 'package:training_diet/ui/pages/workout_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
        child: BottomNavigationBar(
          iconSize: 40,
          selectedIconTheme: IconThemeData(
            color: const Color(0xFF200087),
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.black12,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.home),
              ),
              title: Text(
                "Home",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.search),
              ),
              title: Text(
                "Search",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.person),
              ),
              title: Text(
                "Profile",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: height * .35,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40),
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(32, 40, 16, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "${DateFormat("EEEE").format(DateTime.now())}, ${DateFormat("d MMMM").format(DateTime.now())}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      subtitle: Text(
                        "Hello, Igor",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      trailing: ClipOval(
                          child: Image.asset("assets/images/user.png")),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RadialProgress(
                          width: height * .14,
                          height: height * .14,
                          progress: 0.7,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            IngredientProgress(
                              ingredient: "Protein",
                              progress: .3,
                              progressColor: Colors.green,
                              leftAmount: 72,
                              width: width * .4,
                            ),
                            SizedBox(height: 10),
                            IngredientProgress(
                              ingredient: "Carbs",
                              progress: .2,
                              progressColor: Colors.red,
                              leftAmount: 252,
                              width: width * .4,
                            ),
                            SizedBox(height: 10),
                            IngredientProgress(
                              ingredient: "Fat",
                              progress: .1,
                              progressColor: Colors.green,
                              leftAmount: 61,
                              width: width * .4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * .35,
            left: 0,
            right: 0,
            child: Container(
              height: height - kBottomNavigationBarHeight - (height * .38),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                        left: 32,
                        right: 16,
                      ),
                      child: Text(
                        "MEALS FOR TODAY",
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      height: height * .35,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          SizedBox(width: 32),
                          for (int i = 0; i < meals.length; i++)
                            MealCard(meal: meals[i]),
                        ]),
                      ),
                    ),
                    SizedBox(height: 20),
                    OpenContainer(
                      closedElevation: 0,
                      closedColor: const Color(0xFFE9E9E9),
                      transitionType: ContainerTransitionType.fade,
                      transitionDuration: Duration(milliseconds: 700),
                      openBuilder: (context, _) {
                        return WorkoutScreen();
                      },
                      closedBuilder:
                          (BuildContext _, VoidCallback openContainer) {
                        return GestureDetector(
                          onTap: openContainer,
                          child: Container(
                            height: height * .3,
                            margin: const EdgeInsets.only(
                                bottom: 10, left: 32, right: 32),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xFF20008B),
                                  const Color(0xFF200087),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 26, left: 16),
                                  child: Text(
                                    "YOUR NEXT WORKOUT",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    "Upper Body",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 38,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(width: 20),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF5B4D9D),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                        ),
                                        child: Image.asset(
                                          "assets/images/chest.png",
                                          height: 50,
                                          width: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF5B4D9D),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                        ),
                                        child: Image.asset(
                                          "assets/images/back.png",
                                          height: 50,
                                          width: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF5B4D9D),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                        ),
                                        child: Image.asset(
                                          "assets/images/biceps.png",
                                          height: 50,
                                          width: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 10)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
