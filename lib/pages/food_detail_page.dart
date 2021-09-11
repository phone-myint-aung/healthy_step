import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthy_step/constants/colors.dart';
import 'package:healthy_step/models/ingredient.dart';
import 'package:healthy_step/models/meal.dart';
import 'package:healthy_step/router/router.gr.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FoodInfoPage extends StatelessWidget {
  const FoodInfoPage(this.meal, {Key? key}) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            children: [
              Container(
                child: Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 200),
                    ),
                    image: DecorationImage(
                      image: AssetImage(meal.bgImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //ToDo: exit
                          AutoRouter.of(context).push(MainRoute(pageIndex: 2));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 20, top: 20),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black38,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -40,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              image: DecorationImage(
                                image: AssetImage(meal.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: Text(
                    meal.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w600, height: 1.2),
                  ),
                ),
              ),
              ThreePercentageCircle(
                listPercentage: meal.percentageList,
              ),
              BottomContainer(meal),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer(
    this.meal, {
    Key? key,
  }) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: customContainerColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                Container(
                  height: 95,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: meal.ingredients.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 8),
                        child: IngredientsCard(
                            ingredient: meal.ingredients[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recipes',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 14),
                Text(
                  meal.recipe,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IngredientsCard extends StatelessWidget {
  const IngredientsCard({
    required this.ingredient,
    Key? key,
  }) : super(key: key);
  final Ingredient ingredient;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(ingredient.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          ingredient.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}

class ThreePercentageCircle extends StatelessWidget {
  const ThreePercentageCircle({
    Key? key,
    required this.listPercentage,
  }) : super(key: key);
  final List<int> listPercentage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PercentageWithText(percentage: listPercentage[0], footerText: 'Fats'),
          PercentageWithText(
              percentage: listPercentage[1], footerText: 'Protein'),
          PercentageWithText(
              percentage: listPercentage[2], footerText: 'Carbon\nhydrate'),
        ],
      ),
    );
  }
}

class PercentageWithText extends StatelessWidget {
  const PercentageWithText({
    required this.percentage,
    required this.footerText,
    Key? key,
  }) : super(key: key);
  final int percentage;
  final String footerText;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 85,
      lineWidth: 7,
      animation: true,
      percent: percentage / 100,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: customRedColor,
      center: Text(
        percentage.toString() + '%',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
      footer: Container(
        padding: EdgeInsets.only(top: (footerText.contains('\n')) ? 5 : 18),
        child: Text(
          footerText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
