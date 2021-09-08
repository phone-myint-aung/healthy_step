import 'package:flutter/material.dart';
import 'package:healthy_step/constants/colors.dart';
import 'package:healthy_step/constants/custom_icons.dart';
import 'package:healthy_step/models/meal.dart';
import 'package:healthy_step/models/meal_data.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Container(
                      height: 270.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/fruitfruit.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.6), BlendMode.dstATop),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Healthy Diet Meals',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Learn simple ways to prepare food. \n'
                            'Keep meals preparation easy,eat more  \n'
                            'raw foods such as salads, fruits and  \n'
                            'vegetable juices.',
                            style: TextStyle(
                              height: 1.5,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              MealCategory(
                text: 'Breakfast',
                icon: CustomIcons.breakfast,
                iconColor: Color(0xFFFBC12D),
              ),
              MealScrollView(breakfast),
              MealCategory(
                text: 'Lunch',
                icon: Icons.local_restaurant,
                iconColor: Colors.yellow,
              ),
              MealScrollView(lunch),
              MealCategory(
                text: 'Dinner',
                icon: CustomIcons.dinner,
                iconColor: customGreenColor,
              ),
              MealScrollView(dinner),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class MealScrollView extends StatelessWidget {
  const MealScrollView(
    this.meals, {
    Key? key,
  }) : super(key: key);
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: [
            ...List.generate(
              meals.length,
              (index) => Padding(
                padding: EdgeInsets.only(left: 20),
                child: MealCard(meals[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  const MealCard(
    this.meal, {
    Key? key,
  }) : super(key: key);
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: customContainerColor,
      ),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -50,
            child: CircleAvatar(
              backgroundImage: AssetImage(meal.image),
              radius: 65,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${meal.title}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 32, bottom: 12, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(CustomIcons.calorie,
                              size: 30, color: Colors.orange),
                          SizedBox(width: 10),
                          Text(
                            '${meal.calories} Cal',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            CustomIcons.time,
                            size: 30,
                            color: customRedColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '${meal.time} m',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MealCategory extends StatelessWidget {
  const MealCategory({
    Key? key,
    required this.text,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(left: 24, top: 30, bottom: 70),
      decoration: BoxDecoration(
        color: customContainerColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 5),
          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
        ],
      ),
    );
  }
}
