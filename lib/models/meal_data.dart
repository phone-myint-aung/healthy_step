import 'package:healthy_step/models/ingredient.dart';
import 'package:healthy_step/models/meal.dart';

List<Meal> breakfast = [
  Meal(
    title: "Fruit Sandwich",
    calories: 266,
    time: 10,
    image: "assets/images/realfruitsandwich.jpg",
    bgImage: "assets/images/sand.jpg",
    percentageList: [27, 18, 21],
    ingredients: [
      Ingredient(name: 'Cream', imagePath: 'assets/images/whippedcream.jpg'),
      Ingredient(name: 'Mascar\npone', imagePath: 'assets/images/mas.jpg'),
      Ingredient(name: 'Sugar', imagePath: 'assets/images/sugar.jpg'),
      Ingredient(name: 'Jam', imagePath: 'assets/images/jam.jpg'),
      Ingredient(name: 'Bread', imagePath: 'assets/images/bread.jpg'),
      Ingredient(name: 'Staw\nberries', imagePath: 'assets/images/staw.jpg'),
      Ingredient(name: 'Kiwi', imagePath: 'assets/images/kiwi.jpg'),
      Ingredient(name: 'Banana', imagePath: 'assets/images/banana.jpg'),
    ],
    recipe:
        '1. Spread butter and jam.Take two bread slices and spread jam on one and butter on another.\n'
        '\n'
        '2. Place the fruits.Now slice the fruits as thinly as possible and properly spread on one bread slice. Sprinkle a pinch of salt to balance the flavours.Cover it with another bread slice.\n'
        '\n'
        '3. Ready to be served.Your fruity sandwich is ready to be served.',
  ),
  Meal(
    title: "Smoothie Bowl",
    calories: 234,
    time: 8,
    image: "assets/images/smoothiebowl.jpg",
    bgImage: "assets/images/bowl.jpg",
    percentageList: [50, 34, 25],
    ingredients: [
      Ingredient(name: 'Banana', imagePath: 'assets/images/banana.jpg'),
      Ingredient(name: 'Staw\nberries', imagePath: 'assets/images/staw.jpg'),
      Ingredient(
          name: 'Rolled\nOats', imagePath: 'assets/images/irolledoats.jpg'),
      Ingredient(
          name: 'Almond\nMilk', imagePath: 'assets/images/ialmondmilk.jpg'),
      Ingredient(name: 'Chia\nSeeds', imagePath: 'assets/images/ichiaseeds.jpg'),
      Ingredient(name: 'Nut\nButter', imagePath: 'assets/images/inutbutter.jpg'),
      Ingredient(
          name: 'Agave\nSyrup', imagePath: 'assets/images/iagavesyrup.jpg'),
    ],
    recipe:
        '1. Prepare spiced walnuts: Preheat oven to 350°F. Place walnuts on a baking sheet and toast for 8 minutes, until fragrant. In a small bowl, combine walnuts with cinnamon and salt. Toss to coat, then set aside to cool.\n'
        '\n'
        '2. Prepare smoothie base: Combine smoothie base ingredients in a high- speed blender. Purée until smooth.\n'
        '\n'
        '3. Pour smoothie base into a bowl and garnish with spiced walnuts, blueberries, strawberries, pomegranate seeds, cacao nibs, hemp seeds and a dusting of spirulina.',
  ),
  Meal(
    title: "Rolled Omelette",
    calories: 234,
    time: 10,
    image: "assets/images/rolledomelette.jpg",
    bgImage: "assets/images/rolled.jpg",
    percentageList: [33, 22, 0],
    ingredients: [
      Ingredient(name: 'Eggs', imagePath: 'assets/images/ieggs.jpg'),
      Ingredient(name: 'Scallion', imagePath: 'assets/images/iscallion.jpg'),
      Ingredient(name: 'Carrot', imagePath: 'assets/images/icarrot.jpg'),
      Ingredient(name: 'Salts', imagePath: 'assets/images/isalts.jpg'),
      Ingredient(
          name: 'Vegetable Oil', imagePath: 'assets/images/ivegetableoil.jpg'),
    ],
    recipe:
        '1. Preheat the pan until it feels hot when you place your hand 2 to 3 inches above the bottom of the pan.\n'
        '\n'
        '2. Do not overcrowd the egg mixture with the fillings. It would be harder to roll up.\n'
        '\n'
        '3. Be patient and cook the eggs over gentle heat. If the heat is too high, you’ll end up with tough eggs that will break when folded. If you don’t cook the eggs enough, the rolled egg will be runny inside.\n'
        '\n'
        '4.Use both hands to roll, each holding a spatula, a spoon or a pair of chopsticks.\n'
        '\n'
        '5.Use a small skillet if you want your rolls to be thick.',
  ),
  Meal(
    title: "Breakfast Pocket",
    calories: 234,
    time: 11,
    image: "assets/images/pocket.jpg",
    bgImage: "assets/images/pocket.jpg",
    percentageList: [15, 16, 4],
    ingredients: [
      Ingredient(name: 'Eggs', imagePath: 'assets/images/ieggs.jpg'),
      Ingredient(name: 'Water', imagePath: 'assets/images/iwater.jpg'),
      Ingredient(name: 'Salts', imagePath: 'assets/images/isalts.jpg'),
      Ingredient(
          name: 'Black Pepper', imagePath: 'assets/images/iblackpepper.jpg'),
      Ingredient(name: 'Butter', imagePath: 'assets/images/ibutter.jpg'),
      Ingredient(
          name: 'Crescent Rolls',
          imagePath: 'assets/images/icrescentrolls.jpg'),
      Ingredient(name: 'Deli Ham', imagePath: 'assets/images/ideliham.jpg'),
      Ingredient(
          name: 'Cheddar Cheese',
          imagePath: 'assets/images/icheddercheese.jpg'),
    ],
    recipe:
        '1. Preheat oven to 375 degrees F. In a medium bowl, whisk eggs, water, salt, and pepper.\n'
        '\n'
        '2. In a large skillet over medium heat, melt butter. Add egg mixture and cook 1 to 2 minutes, or until set, stirring occasionally.\n'
        '\n'
        '3. Separate crescent rolls into 4 rectangles, and pinch perforations together. Top each rectangle with a slice of ham, then spoon egg evenly on top half of rectangle; sprinkle with cheese. Fold dough over filling, pressing edges to seal.\n'
        '\n'
        '4.Place on baking sheet and bake 10 to 12 minutes, or until golden brown. Serve immediately.',
  ),
  Meal(
    title: "Pumpkin Cookie",
    calories: 234,
    time: 12,
    image: "assets/images/pumpcok.jpg",
    bgImage: "assets/images/cooo.jpg",
    percentageList: [6, 12, 10],
    ingredients: [
      Ingredient(
          name: 'Rolled Oats', imagePath: 'assets/images/irolledoats.jpg'),
      Ingredient(
          name: 'Pumpkin Pure', imagePath: 'assets/images/ipumpkinpure.jpg'),
      Ingredient(
          name: 'Maple Syrup', imagePath: 'assets/images/imaplesyrup.jpeg'),
      Ingredient(
          name: 'Pumpkinpie Spice',
          imagePath: 'assets/images/ipumpkinpiespice.jpg'),
      Ingredient(name: 'Cinnamon', imagePath: 'assets/images/icinnamon.jpg'),
      Ingredient(
          name: 'Chocolate Chip', imagePath: 'assets/images/ichocochip.jpg'),
    ],
    recipe:
        ' 1. Mix all of the ingredients together to form a thick dough. There’s no need to worry about over mixing, just keep working it together until  have a uniform dough.\n'
        '\n'
        '2. Form the batter into 12 cookie shapes using your hands and place them on a baking sheet.\n'
        '\n'
        '3. Bake the cookies! They need just 10 minutes at 350 degrees F. Let them cool on the pan for a few minutes then enjoy warm or let cool before storing.',
  ),
];

List<Meal> lunch = [
  Meal(
    title: "Pasta Salad",
    calories: 215,
    time: 20,
    image: "assets/images/pastasalad.jpg",
    bgImage: "assets/images/ppss.jpg",
    percentageList: [7, 14, 13],
    ingredients: [
      Ingredient(name: 'Cucumber', imagePath: 'assets/images/icucumber.jpg'),
      Ingredient(
          name: 'Green Bell Pepper',
          imagePath: 'assets/images/igreenbellpepper.jpg'),
      Ingredient(name: 'Tomatoes', imagePath: 'assets/images/itomatoes.jpg'),
      Ingredient(
          name: 'Black Olive', imagePath: 'assets/images/iblackolive.jpg'),
      Ingredient(
          name: 'Salad Seasoning', imagePath: 'assets/images/iseasoning.jpg'),
      Ingredient(
          name: 'French Salad Dressing',
          imagePath: 'assets/images/ifrenchdressing.jpg'),
      Ingredient(
          name: 'Dry Wheat Spaghetti',
          imagePath: 'assets/images/idryspaghetti.jpg'),
    ],
    recipe: '1.Cook pasta according to directions on the box.\n'
        '\n'
        '2. While pasta is cooking, chop up all of the vegetables.\n'
        '\n'
        '3. Drain pasta and mix with the chopped vegetables.\n'
        '\n'
        '4.Add both dressings and salad supreme seasoning, and mix until combined.\n'
        '\n'
        '5.Chill and serve.',
  ),
  Meal(
    title: "Chickpea Salad",
    calories: 175,
    time: 30,
    image: "assets/images/chickpea.jpg",
    bgImage: "assets/images/pea.jpg",
    percentageList: [3, 18, 14],
    ingredients: [
      Ingredient(name: 'Couscous', imagePath: 'assets/images/icouscous.jpg'),
      Ingredient(
          name: 'Chickpeas', imagePath: 'assets/images/icanchickpeas.jpg'),
      Ingredient(name: 'Hot Water', imagePath: 'assets/images/ihotwater.jpg'),
      Ingredient(name: 'Lemon', imagePath: 'assets/images/ilemon.jpg'),
      Ingredient(name: 'Red Pepper', imagePath: 'assets/images/iredpepper.jpg'),
      Ingredient(name: 'Pistachios', imagePath: 'assets/images/ipistachio.jpg'),
      Ingredient(
          name: 'Mint Leaves', imagePath: 'assets/images/imintleaves.jpg'),
      Ingredient(
          name: 'Greek Yogurt', imagePath: 'assets/images/igreekyogurt.jpg'),
    ],
    recipe:
        '1. Place chickpeas and cous cous in a bowl and pour the hot water with chicken stock over them.\n'
        '\n'
        '2. Cover and allow the cous-cous to fully absorb the stock (5 – 10 minutes)\n'
        '\n'
        '3. Let cool a little and stir in the lemon juice, pepper, pistachios and mint.\n'
        '\n'
        '4. Top with yoghurt and harissa.',
  ),
  Meal(
    title: "Egg and Salad",
    calories: 205,
    time: 25,
    image: "assets/images/eggandsalad.jpg",
    bgImage: "assets/images/eggsalad.jpg",
    percentageList: [86, 12, 2],
    ingredients: [
      Ingredient(name: 'Eggs', imagePath: 'assets/images/ieggs.jpg'),
      Ingredient(
          name: 'Mayonnaise', imagePath: 'assets/images/imayonnaise.jpg'),
      Ingredient(name: 'Celery', imagePath: 'assets/images/istalkcelery.jpg'),
      Ingredient(name: 'Onion', imagePath: 'assets/images/ionion.jpg'),
      Ingredient(name: 'Dill', imagePath: 'assets/images/idill.jpg'),
      Ingredient(
          name: 'Dijon Mustard', imagePath: 'assets/images/idijonmustard.jpg'),
      Ingredient(name: 'Lemon', imagePath: 'assets/images/ilemon.jpg'),
      Ingredient(
          name: 'Kosher Salt', imagePath: 'assets/images/ikoshersalt.jpg'),
      Ingredient(
          name: 'Black Pepper', imagePath: 'assets/images/iblackpepper.jpg'),
    ],
    recipe:
        '1. Cover the eggs with at least 2 inches of water in a medium saucepan and bring to a rolling boil. Remove from the heat, cover and let sit for 10 minutes. Transfer the eggs to a bowl of ice water to cool completely.\n'
        '\n'
        '2. Mix together the mayonnaise, celery, onions, parsley, mustard, lemon juice, 1/2 teaspoon salt and a few grinds of black pepper in a medium bowl. Peel and roughly chop the eggs, add to the mayonnaise mixture and toss gently to combine. Serve right away, or cover and refrigerate for up to 2 days.',
  ),
  Meal(
    title: "Salad",
    calories: 236,
    time: 5,
    image: "assets/images/salad.jpg",
    bgImage: "assets/images/ssaall.jpg",
    percentageList: [19, 8, 5],
    ingredients: [
      Ingredient(
          name: 'Vegetable Oil', imagePath: 'assets/images/ivegetableoil.jpg'),
      Ingredient(
          name: 'Peanut Butter', imagePath: 'assets/images/ipeanutbutter.jfif'),
      Ingredient(name: 'Cabbage', imagePath: 'assets/images/icabbage.jpg'),
      Ingredient(
          name: 'Red Bell Pepper', imagePath: 'assets/images/iredpepper.jpg'),
      Ingredient(name: 'Carrot', imagePath: 'assets/images/icarrot.jpg'),
      Ingredient(name: 'Onion', imagePath: 'assets/images/ionion.jpg'),
      Ingredient(name: 'Cilantro', imagePath: 'assets/images/icilantro.jpg'),
    ],
    recipe:
        '1. In a medium bowl, whisk together the rice vinegar, oil, peanut butter, soy sauce, brown sugar, ginger, and garlic.\n'
        '\n'
        '2. In a large bowl, mix the green cabbage, red cabbage, napa cabbage, red bell peppers, carrots, green onions, and cilantro. Toss with the peanut butter mixture just before serving.',
  ),
  Meal(
    title: "Ranch Frittata",
    calories: 136,
    time: 30,
    image: "assets/images/veggie.jpg",
    bgImage: "assets/images/ranchfrittata.jpg",
    percentageList: [18, 30, 2],
    ingredients: [
      Ingredient(name: 'Bacon', imagePath: 'assets/images/ibacon.jpg'),
      Ingredient(name: 'Olive Oil', imagePath: 'assets/images/ioliveoil.jpg'),
      Ingredient(name: 'Pepper', imagePath: 'assets/images/ipepperflakes.jpg'),
      Ingredient(name: 'Salts', imagePath: 'assets/images/isalts.jpg'),
      Ingredient(
          name: 'Black Pepper', imagePath: 'assets/images/iblackpepper.jpg'),
      Ingredient(name: 'Potatoes', imagePath: 'assets/images/ipotatoes.jpg'),
      Ingredient(name: 'Eggs', imagePath: 'assets/images/ieggs.jpg'),
      Ingredient(
          name: 'Feta Cheese', imagePath: 'assets/images/ifetacheese.jpg'),
    ],
    recipe:
        '1. Place bacon and olive oil in a large skillet over medium heat. Cook until bacon is nearly crisp, 5 to 7 minutes. Add peppers; cook and stir over medium heat until softened, about 3 minutes. Remove from heat and drain excess grease from the pan. Season with salt, black pepper, and red pepper flakes; stir to combine.\n'
        '\n'
        '2. Return pan to medium heat, add potatoes and stir until warmed through, about 2 minutes. Pour in eggs and slowly stir to form large, soft curds, about 5 minutes. Sprinkle feta cheese over the top and stir gently to incorporate.\n'
        '\n'
        '3. Set oven rack about 6 inches from the heat source and preheat the oven broiler.\n'
        '\n'
        '4. Place pan under the preheated broiler and cook until the top is set and feta cheese is browned, about 5 minutes.',
  ),
];

List<Meal> dinner = [
  Meal(
    title: "Shrimp salad",
    calories: 319,
    time: 25,
    image: "assets/images/shrimpavo.jpg",
    bgImage: "assets/images/savo.jpg",
    percentageList: [26, 58, 5],
    ingredients: [
      Ingredient(name: 'Butter', imagePath: 'assets/images/ibutter.jpg'),
      Ingredient(name: 'Shrimp', imagePath: 'assets/images/ishrimp.jpg'),
      Ingredient(name: 'Dill', imagePath: 'assets/images/idill.jpg'),
      Ingredient(name: 'Tomatoes', imagePath: 'assets/images/itomatoes.jpg'),
      Ingredient(name: 'Avogado', imagePath: 'assets/images/iavo.jpg'),
      Ingredient(
          name: 'Black Olive', imagePath: 'assets/images/iblackolive.jpg'),
      Ingredient(name: 'Onion', imagePath: 'assets/images/ionion.jpg'),
      Ingredient(name: 'Olive Oil', imagePath: 'assets/images/ioliveoil.jpg'),
      Ingredient(name: 'Lemon', imagePath: 'assets/images/ilemon.jpg'),
    ],
    recipe:
        '1. Stir together avocadoes, tomatoes, onion, and shrimp in a large bowl. Season to taste with salt and pepper. Stir in lime juice. Serve cold.\n',
  ),
  Meal(
    title: "Turkey Cabbage",
    calories: 195,
    time: 20,
    image: "assets/images/cabbage.jpg",
    bgImage: "assets/images/turcab.jpg",
    percentageList: [3, 36, 3],
    ingredients: [
      Ingredient(name: 'Olive Oil', imagePath: 'assets/images/ioliveoil.jpg'),
      Ingredient(
          name: 'Ground Turkey', imagePath: 'assets/images/igroundturkey.jpg'),
      Ingredient(name: 'Onion', imagePath: 'assets/images/ionion.jpg'),
      Ingredient(name: 'Salts', imagePath: 'assets/images/isalts.jpg'),
      Ingredient(name: 'Pepper', imagePath: 'assets/images/ipepperflakes.jpg'),
      Ingredient(name: 'Cabbage', imagePath: 'assets/images/icabbage.jpg'),
      Ingredient(name: 'Carrot', imagePath: 'assets/images/icarrot.jpg'),
    ],
    recipe:
        '1.Heat a dutch oven or large pot over medium-high heat.Add olive oil, ground turkey, onion, garlic, and salt and pepper. Stir occasionally until turkey is cooked through.\n'
        '\n'
        '2. Remove half the turkey mixture and set aside.Layer half the cabbage and carrots over the turkey still in the pot.Sprinkle with 1 tsp of caraway seeds and salt and pepper.\n'
        '\n'
        '3.Add the remaining turkey in a layer, then another layer of cabbage and carrots.Sprinkle with remaining caraway seeds and more salt and pepper.Add chicken broth and cover.\n'
        '\n'
        '4.Cook until cabbage is tender, about 15 minutes.Stir right before serving.',
  ),
  Meal(
    title: "Zucchini Pasta",
    calories: 215,
    time: 25,
    image: "assets/images/zupasta.jpg",
    bgImage: "assets/images/zucchi.jpg",
    percentageList: [18, 46, 1],
    ingredients: [
      Ingredient(name: 'Zucchini', imagePath: 'assets/images/izucchini.jpg'),
      Ingredient(name: 'Olive Oil', imagePath: 'assets/images/ioliveoil.jpg'),
      Ingredient(name: 'Salts', imagePath: 'assets/images/isalts.jpg'),
      Ingredient(name: 'Dill', imagePath: 'assets/images/idill.jpg'),
      Ingredient(name: 'Pepper', imagePath: 'assets/images/ipepperflakes.jpg'),
    ],
    recipe:
        '1.Cut the ends from each of the zucchinis and put the zucchini through a zucchini noodle maker.Heat the olive oil or unsalted butter in a large pan.\n'
        '\n'
        '2.Add the zucchini spaghetti, salt, pepper and dill. Quickly sauté́ the zucchini until crisp-tender (it will cook fast, in less than five minutes).Taste and adjust the seasonings to your preference.\n'
        '\n'
        '3. Serve twirled onto the plate.',
  ),
  Meal(
    title: "Salad Greens",
    calories: 256,
    time: 15,
    image: "assets/images/greensalad.jpg",
    bgImage: "assets/images/saladgr.jpg",
    percentageList: [1, 12, 6],
    ingredients: [
      Ingredient(name: 'Onion', imagePath: 'assets/images/ionion.jpg'),
      Ingredient(
          name: 'Dijon Mustard', imagePath: 'assets/images/idijonmustard.jpg'),
      Ingredient(name: 'Salts', imagePath: 'assets/images/isalts.jpg'),
      Ingredient(name: 'Pepper', imagePath: 'assets/images/ipepperflakes.jpg'),
      Ingredient(
          name: 'Water Cress',
          imagePath: 'assets/images/itrimmedwatercress.jpg'),
      Ingredient(name: 'Grape', imagePath: 'assets/images/igrape.jpg'),
      Ingredient(
          name: 'Blue Cheese', imagePath: 'assets/images/ibluecheese.jpg'),
      Ingredient(name: 'Pecans', imagePath: 'assets/images/ipecans.jpg'),
    ],
    recipe:
        '1.Whisk oil, vinegar, shallot, mustard, salt and pepper in a large bowl. Add watercress and grapes and toss to coat. Add cheese and pecans and gently toss to combine.',
  ),
  Meal(
    title: "Hasselback",
    calories: 355,
    time: 50,
    image: "assets/images/hasselback.jpg",
    bgImage: "assets/images/hchicken.jpg",
    percentageList: [24, 22, 1],
    ingredients: [
      Ingredient(
          name: 'Chicken Breasts',
          imagePath: 'assets/images/ichickenbreasts.jpg'),
      Ingredient(
          name: 'Mozzarella Cheese',
          imagePath: 'assets/images/imozzarellacheese.jpeg'),
      Ingredient(name: 'Grape', imagePath: 'assets/images/igrape.jpg'),
      Ingredient(name: 'Tomatoes', imagePath: 'assets/images/itomatoes.jpg'),
      Ingredient(
          name: 'Basil Leaves', imagePath: 'assets/images/ibasilleaves.jpg'),
      Ingredient(
          name: 'Italian Seasoning',
          imagePath: 'assets/images/iitalianseasoning.jfif'),
      Ingredient(name: 'Salts', imagePath: 'assets/images/isalts.jpg'),
      Ingredient(name: 'Pepper', imagePath: 'assets/images/ipepperflakes.jpg'),
      Ingredient(name: 'Olive Oil', imagePath: 'assets/images/ioliveoil.jpg'),
    ],
    recipe:
        '1.Preheat oven to 375 degrees F. Coat a large rimmed baking sheet with cooking spray.\n'
        '\n'
        '2. Make crosswise cuts every 1/2 inch along both chicken breasts, slicing almost to the bottom but not all the way through. Sprinkle chicken with 1/4 teaspoon each salt and pepper. Fill the cuts alternately with tomato and mozzarella slices. Brush with pesto. Transfer the chicken to one side of the prepared baking sheet.\n'
        '\n'
        '3. Toss broccoli, oil and the remaining 1/4 teaspoon each salt and pepper in a large bowl. If there are any tomato slices left, mix them in. Transfer the broccoli mixture to the empty side of the baking sheet.\n'
        '\n'
        '4. Bake until the chicken is no longer pink in the center and the broccoli is tender, about 25 minutes. Cut each breast in half and serve with the broccoli.',
  ),
];
