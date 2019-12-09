
/*
Digital Cookbook
Patrick Lee & Pardis Roshanz 2019
Sample Queries
- What are the ingredients for X?
- Do I have the ingredients to make X?
- What ingredients am I missing to make X?
- What vegan recipes can I make?
- What gluten_free recipes can I make?
- What X-calorie recipes can I make?
- What can I make for breakfast?
- What can I make for lunch?
- What can I make for dinner?
- What can I make for dessert?
*/

/*
Ingredient list for testing:
butter, buttermilk, cheddar_cheese, cheese_curds, heavy_cream, milk, mozzarella_cheese, parmesan_cheese, sour_cream, swiss_cheese, bacon, beef, chicken, ground_beef, ham, pepperoni, pork_shoulder, ribs, turkey, cod, crab, salmon, seaweed, tuna, apple_juice, lemon_juice, orange_juice, water, alfredo_sauce, bbq_sauce, canola_oil, gravy, jam, ketchup, marinara_sauce, mayo, mustard, olive_oil, rice_wine_vinegar, salsa, sesame_oil, soy_sauce, spiced_rum, syrup, cinnamon, cumin, ground_pepper, kosher_salt, salt, basil, bay_leaf, mint, oregano, parsley, rosemary, sage, thyme, apples, avocado, blueberries, coconut, lemons, limes, nectarines, oranges, beans, broccoli, carrots, chickpeas, cucumbers, eggplant, garlic, jalapeno_peppers, lettuce, onions, peas, peppers, pickles, potatoes, rhubarb, spring_onion, baking_soda, baking_powder, brown_sugar, chocolate, cocoa_powder, eggs, flour, oatmeal, powdered_sugar, shortening, vanilla, white_sugar, yeast, cuban_bread, hamburger_bun, lasagna_sheets, noodles, pasta, rice, sliced_bread, tortilla, cauliflower, hot_sauce, peanuts
*/

% Getting input from user

q(Ans):-
  write("What ingredients do you have: "), flush_output(current_output),
  readln(Ingredients),
  write("Ask me: "), flush_output(current_output),
  readln(Question),
  question(Ingredients,Question,Ans).

% Helper functions for questions
% has_ingredients(Recipe, Ingredients) succeeds if all ingredients needed for Recipe are present.
has_ingredients(Recipe, Ingredients) :-
  recipe(Recipe, _),
  ingredients(Recipe, I),
  contained_in(I, Ingredients).

% missing_ingredients takes a recipe and list of ingredients you have and returns ingredients missing to complete the recipe.
missing_ingredients(Recipe, Ingredients, Missing) :-
  ingredients(Recipe, I),
  missing_ingredient(I,Ingredients,Missing).

% missing_ingredient returns ingredients in the recipe which are not in your ingredients list
% missing_ingredient(Recipe_ingredients, Ingredients, Missing)
missing_ingredient(RI, [], RI).
missing_ingredient([], _, []).
% Recipe ingredient is in your basket
missing_ingredient([H|T], Ingredients, R) :-
  member(H, Ingredients),
  missing_ingredient(T, Ingredients, R).
% Add missing recipe ingredient to result
missing_ingredient([H|T], Ingredients, [H|R]) :-
  missing_ingredient(T, Ingredients, R).

% contained_in(L1, L2) succeeds if all elements of L1 are contained in L2.
contained_in(L1, L2) :-
  maplist(contains(L2), L1).
contains(L, X) :- member(X, L).

% Questions

question(_, [what, are, the, ingredients, for, R, ?], I) :-
  ingredients(R,I).

question(_, [what, are, the, ingredients, for, R], I) :-
  ingredients(R,I).

question(Ingredients, [what, can, i, make, for, breakfast, ?], A) :-
  recipe(A, breakfast),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, can, i, make, for, breakfast], A) :-
  recipe(A, breakfast),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, can, i, make, for, lunch, ?], A) :-
  recipe(A, lunch),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, can, i, make, for, lunch], A) :-
  recipe(A, lunch),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, can, i, make, for, dinner, ?], A) :-
  recipe(A, dinner),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, can, i, make, for, dinner], A) :-
  recipe(A, dinner),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, can, i, make, for, dessert, ?], A) :-
  recipe(A, dessert),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, can, i, make, for, dessert], A) :-
  recipe(A, dessert),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, vegan, recipes, can, i, make, ?], A) :-
  recipe(A, vegan),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, vegan, recipes, can, i, make], A) :-
  recipe(A, vegan),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, gluten_free, recipes, can, i, make, ?], A) :-
  recipe(A, gluten_free),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, gluten_free, recipes, can, i, make], A) :-
  recipe(A, gluten_free),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, recipes, can, i, make, ?], A) :-
  recipe(A, high_calorie),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, recipes, can, i, make], A) :-
  recipe(A, high_calorie),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, recipes, can, i, make, ?], A) :-
  recipe(A, high_calorie),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, recipes, can, i, make], A) :-
  recipe(A, high_calorie),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, vegan, recipes, can, i, make, ?], A) :-
  recipe(A, high_calorie),
  recipe(A, vegan),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, vegan, recipes, can, i, make], A) :-
  recipe(A, high_calorie),
  recipe(A, vegan),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, vegan, recipes, can, i, make, ?], A) :-
  recipe(A, low_calorie),
  recipe(A, vegan),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, vegan, recipes, can, i, make], A) :-
  recipe(A, low_calorie),
  recipe(A, vegan),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, gluten_free, recipes, can, i, make, ?], A) :-
  recipe(A, gluten_free),
  recipe(A, vegan),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, gluten_free, recipes, can, i, make], A) :-
  recipe(A, high_calorie),
  recipe(A, gluten_free),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, gluten_free, recipes, can, i, make, ?], A) :-
  recipe(A, low_calorie),
  recipe(A, gluten_free),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, gluten_free, recipes, can, i, make], A) :-
  recipe(A, low_calorie),
  recipe(A, gluten_free),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, vegan, recipes, can, i, make, for, breakfast, ?], A) :-
  recipe(A, high_calorie),
  recipe(A, vegan),
  recipe(A, breakfast),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, vegan, recipes, can, i, make, for, breakfast], A) :-
  recipe(A, high_calorie),
  recipe(A, vegan),
  recipe(A, breakfast),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, vegan, recipes, can, i, make, for, breakfast, ?], A) :-
  recipe(A, low_calorie),
  recipe(A, vegan),
  recipe(A, breakfast),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, vegan, recipes, can, i, make, for, breakfast], A) :-
  recipe(A, low_calorie),
  recipe(A, vegan),
  recipe(A, breakfast),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, vegan, recipes, can, i, make, for, lunch, ?], A) :-
  recipe(A, high_calorie),
  recipe(A, vegan),
  recipe(A, lunch),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, vegan, recipes, can, i, make, for, lunch], A) :-
  recipe(A, high_calorie),
  recipe(A, vegan),
  recipe(A, lunch),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, vegan, recipes, can, i, make, for, lunch, ?], A) :-
  recipe(A, low_calorie),
  recipe(A, vegan),
  recipe(A, lunch),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, vegan, recipes, can, i, make, for, lunch], A) :-
  recipe(A, low_calorie),
  recipe(A, vegan),
  recipe(A, lunch),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, vegan, recipes, can, i, make, for, dinner, ?], A) :-
  recipe(A, high_calorie),
  recipe(A, vegan),
  recipe(A, dinner),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, vegan, recipes, can, i, make, for, dinner], A) :-
  recipe(A, high_calorie),
  recipe(A, vegan),
  recipe(A, dinner),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, vegan, recipes, can, i, make, for, dinner, ?], A) :-
  recipe(A, low_calorie),
  recipe(A, vegan),
  recipe(A, dinner),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, vegan, recipes, can, i, make, for, dinner], A) :-
  recipe(A, low_calorie),
  recipe(A, vegan),
  recipe(A, dinner),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, vegan, recipes, can, i, make, for, dessert, ?], A) :-
  recipe(A, high_calorie),
  recipe(A, vegan),
  recipe(A, dessert),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, vegan, recipes, can, i, make, for, dessert], A) :-
  recipe(A, high_calorie),
  recipe(A, vegan),
  recipe(A, dessert),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, vegan, recipes, can, i, make, for, dessert, ?], A) :-
  recipe(A, low_calorie),
  recipe(A, vegan),
  recipe(A, dessert),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, vegan, recipes, can, i, make, for, dessert], A) :-
  recipe(A, low_calorie),
  recipe(A, vegan),
  recipe(A, dessert),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, gluten_free, recipes, can, i, make, for, breakfast, ?], A) :-
  recipe(A, high_calorie),
  recipe(A, gluten_free),
  recipe(A, breakfast),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, gluten_free, recipes, can, i, make, for, breakfast], A) :-
  recipe(A, high_calorie),
  recipe(A, gluten_free),
  recipe(A, breakfast),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, gluten_free, recipes, can, i, make, for, breakfast, ?], A) :-
  recipe(A, low_calorie),
  recipe(A, gluten_free),
  recipe(A, breakfast),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, gluten_free, recipes, can, i, make, for, breakfast], A) :-
  recipe(A, low_calorie),
  recipe(A, gluten_free),
  recipe(A, breakfast),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, gluten_free, recipes, can, i, make, for, lunch, ?], A) :-
  recipe(A, high_calorie),
  recipe(A, gluten_free),
  recipe(A, lunch),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, gluten_free, recipes, can, i, make, for, lunch], A) :-
  recipe(A, high_calorie),
  recipe(A, gluten_free),
  recipe(A, lunch),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, gluten_free, recipes, can, i, make, for, lunch, ?], A) :-
  recipe(A, low_calorie),
  recipe(A, gluten_free),
  recipe(A, lunch),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, gluten_free, recipes, can, i, make, for, lunch], A) :-
  recipe(A, low_calorie),
  recipe(A, gluten_free),
  recipe(A, lunch),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, gluten_free, recipes, can, i, make, for, dinner, ?], A) :-
  recipe(A, high_calorie),
  recipe(A, gluten_free),
  recipe(A, dinner),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, gluten_free, recipes, can, i, make, for, dinner], A) :-
  recipe(A, high_calorie),
  recipe(A, gluten_free),
  recipe(A, dinner),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, gluten_free, recipes, can, i, make, for, dinner, ?], A) :-
  recipe(A, low_calorie),
  recipe(A, gluten_free),
  recipe(A, dinner),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, gluten_free, recipes, can, i, make, for, dinner], A) :-
  recipe(A, low_calorie),
  recipe(A, gluten_free),
  recipe(A, dinner),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, gluten_free, recipes, can, i, make, for, dessert, ?], A) :-
  recipe(A, high_calorie),
  recipe(A, gluten_free),
  recipe(A, dessert),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, high_calorie, gluten_free, recipes, can, i, make, for, dessert], A) :-
  recipe(A, high_calorie),
  recipe(A, gluten_free),
  recipe(A, dessert),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, gluten_free, recipes, can, i, make, for, dessert, ?], A) :-
  recipe(A, low_calorie),
  recipe(A, gluten_free),
  recipe(A, dessert),
  has_ingredients(A, Ingredients).

question(Ingredients, [what, low_calorie, gluten_free, recipes, can, i, make, for, dessert], A) :-
  recipe(A, low_calorie),
  recipe(A, gluten_free),
  recipe(A, dessert),
  has_ingredients(A, Ingredients).

question(Ingredients, [do, i, have, the, ingredients, to, make, R, ?], _) :-
  recipe(R, _),
  has_ingredients(R, Ingredients),
  write('yes').

question(Ingredients, [do, i, have, the, ingredients, to, make, R], _) :-
  recipe(R, _),
  has_ingredients(R, Ingredients),
  write('yes').

question(Ingredients, [do, i, have, the, ingredients, for, R, ?], _) :-
  recipe(R, _),
  has_ingredients(R, Ingredients),
  write('yes').

question(Ingredients, [do, i, have, the, ingredients, for, R], _) :-
  recipe(R, _),
  has_ingredients(R, Ingredients),
  write('yes').

question(Ingredients, [can, i, make, R, ?], _) :-
  recipe(R, _),
  has_ingredients(R, Ingredients),
  write('yes').

question(Ingredients, [can, i, make, R], _) :-
  recipe(R, _),
  has_ingredients(R, Ingredients),
  write('yes').

question(Ingredients, [do, i, have, the, ingredients, to, make, R, ?], _) :-
  recipe(R, _),
  \+ has_ingredients(R, Ingredients),
  write('no').

question(Ingredients, [do, i, have, the, ingredients, to, make, R], _) :-
  recipe(R, _),
  \+ has_ingredients(R, Ingredients),
  write('no').

question(Ingredients, [do, i, have, the, ingredients, for, R, ?], _) :-
  recipe(R, _),
  \+ has_ingredients(R, Ingredients),
  write('no').

question(Ingredients, [do, i, have, the, ingredients, for, R], _) :-
  recipe(R, _),
  \+ has_ingredients(R, Ingredients),
  write('no').

question(Ingredients, [can, i, make, R, ?], _) :-
  recipe(R, _),
  \+ has_ingredients(R, Ingredients),
  write('no').

question(Ingredients, [can, i, make, R], _) :-
  recipe(R, _),
  \+ has_ingredients(R, Ingredients),
  write('no').

question(Ingredients, [what, ingredients, am, i, missing, for, R, ?], Ans) :-
  missing_ingredients(R,Ingredients,Ans).

question(Ingredients, [what, ingredients, am, i, missing, for, R], Ans) :-
  missing_ingredients(R,Ingredients,Ans).

% Database of facts to be queried

% INGREDIENTS

% DAIRY
ingredient(butter).
ingredient(buttermilk).
ingredient(cheddar_cheese).
ingredient(cheese_curds).
ingredient(heavy_cream).
ingredient(milk).
ingredient(mozzarella_cheese).
ingredient(parmesan_cheese).
ingredient(sour_cream).
ingredient(swiss_cheese).

% MEAT
ingredient(bacon).
ingredient(beef).
ingredient(chicken).
ingredient(ground_beef).
ingredient(ham).
ingredient(pepperoni).
ingredient(pork_shoulder).
ingredient(ribs).
ingredient(turkey).

% SEAFOOD
ingredient(cod).
ingredient(crab).
ingredient(salmon).
ingredient(seaweed).
ingredient(tuna).

% DRINKS
ingredient(apple_juice).
ingredient(lemon_juice).
ingredient(orange_juice).
ingredient(water).

% SAUCES/OILS
ingredient(alfredo_sauce).
ingredient(bbq_sauce).
ingredient(canola_oil).
ingredient(gravy).
ingredient(jam).
ingredient(ketchup).
ingredient(marinara_sauce).
ingredient(mayo).
ingredient(mustard).
ingredient(olive_oil).
ingredient(rice_wine_vinegar).
ingredient(salsa).
ingredient(sesame_oil).
ingredient(soy_sauce).
ingredient(spiced_rum).
ingredient(syrup).

% SEASONING
ingredient(cinnamon).
ingredient(cumin).
ingredient(ground_pepper).
ingredient(kosher_salt).
ingredient(salt).

% HERBS
ingredient(basil).
ingredient(bay_leaf).
ingredient(mint).
ingredient(oregano).
ingredient(parsley).
ingredient(rosemary).
ingredient(sage).
ingredient(thyme).

% FRUITS
ingredient(apples).
ingredient(avocado).
ingredient(blueberries).
ingredient(coconut).
ingredient(lemons).
ingredient(limes).
ingredient(nectarines).
ingredient(oranges).
ingredient(peaches).
ingredient(raisins).
ingredient(raspberries).
ingredient(strawberries).
ingredient(tomatoes).

% VEGETABLES
ingredient(beans).
ingredient(broccoli).
ingredient(carrots).
ingredient(cauliflower).
ingredient(chickpeas).
ingredient(cucumbers).
ingredient(eggplant).
ingredient(garlic).
ingredient(jalapeno_peppers).
ingredient(lettuce).
ingredient(onions).
ingredient(peas).
ingredient(peppers).
ingredient(pickles).
ingredient(potatoes).
ingredient(rhubarb).
ingredient(spring_onion).

% BAKING
ingredient(baking_soda).
ingredient(baking_powder).
ingredient(brown_sugar).
ingredient(chocolate).
ingredient(cocoa_powder).
ingredient(eggs).
ingredient(flour).
ingredient(oatmeal).
ingredient(powdered_sugar).
ingredient(shortening).
ingredient(vanilla).
ingredient(white_sugar).
ingredient(yeast).

% GRAINS
ingredient(cuban_bread).
ingredient(hamburger_bun).
ingredient(lasagna_sheets).
ingredient(noodles).
ingredient(pasta).
ingredient(rice).
ingredient(sliced_bread).
ingredient(tortilla).
ingredient(peanuts).


% INGREDIENT LISTS

ingredients(apple_pie, [apples, brown_sugar, butter, cinnamon, flour, shortening, white_sugar]).
ingredients(biscuit, [butter, flour, milk, salt, white_sugar]).
ingredients(blt, [bacon, lettuce, sliced_bread, tomatoes]).
ingredients(blueberry_pie, [blueberries, butter, flour, lemons, shortening, white_sugar]).
ingredients(brownies, [butter, chocolate, cocoa_powder, eggs, flour, milk]).
ingredients(burger, [ground_beef, hamburger_bun, lettuce, onions, salt, tomatoes]).
ingredients(burrito, [beans, rice, ground_beef, salsa, sour_cream]).
ingredients(butter_tarts, [butter, eggs, flour, shortening, white_sugar]).
ingredients(cauliflower_bites, [cauliflower, hot_sauce, salt]).
ingredients(cheese_biscuit, [butter, cheddar_cheese, flour, milk, salt, white_sugar]).
ingredients(cheeseburger, [cheddar_cheese, ground_beef, hamburger_bun, lettuce, onions, salt, tomatoes]).
ingredients(chicken_alfredo, [alfredo, chicken, ground_pepper, pasta]).
ingredients(chicken_caesar_salad, [chicken, lettuce, parmesan_cheese, sliced_bread]).
ingredients(chicken_nuggets, [chicken, eggs, flour, salt]).
ingredients(chicken_parmesan, [chicken, marinara_sauce, mozzarella_cheese, parmesan_cheese]).
ingredients(chicken_pot_pie, [butter, carrots, chicken, flour, heavy_cream, peas, salt, shortening]).
ingredients(chocolate_cake, [baking_powder, butter, chocolate, eggs, flour, milk, white_sugar]).
ingredients(chocolate_lava_cake, [baking_powder, butter, chocolate, eggs, flour, milk, white_sugar]).
ingredients(chocolate_chip_cookies, [butter, chocolate, eggs, flour, milk, white_sugar]).
ingredients(cream_puffs, [butter, eggs, flour, heavy_cream, milk, white_sugar]).
ingredients(crepes, [butter, eggs, flour, milk, white_sugar]).
ingredients(cubanos, [cuban_bread, ham, pickles, swiss_cheese]).
ingredients(eclairs, [butter, chocolate, eggs, flour, heavy_cream, milk, white_sugar]).
ingredients(eggplant_parmesan, [eggplant, marinara_sauce, mozzarella_cheese, parmesan_cheese]).
ingredients(empanadas, [beans, beef, flour, potatoes, salt]).
ingredients(fajitas, [canola_oil, chicken, peppers, salt, tortilla]).
ingredients(falafels, [chickpeas, cumin, garlic, onions, parsley]).
ingredients(fish_n_chips, [buttermilk, cod, egg, flour, potatoes, salt]).
ingredients(french_fries, [canola_oil, potatoes, salt]).
ingredients(french_toast, [cinnamon, eggs, sliced_bread, syrup]).
ingredients(fried_chicken, [buttermilk, chicken, egg, flour, salt]).
ingredients(fruit_salad, [blueberries, nectarines, peaches, raspberries, strawberries]).
ingredients(grilled_cheese_sandwich, [butter, cheddar_cheese, sliced_bread]).
ingredients(hash_browns, [ground_pepper, olive_oil, potatoes, salt]).
ingredients(ice_cream, [heavy_cream, milk, white_sugar, vanilla]).
ingredients(lasagna, [basil, garlic, ground_beef, ground_pepper, lasagna_sheets, marinara_sauce, onions, parmesan_cheese, swiss_cheese]).
ingredients(macarons, [eggs, flour, powdered_sugar, white_sugar]).
ingredients(macaroons, [chocolate, coconut, eggs]).
ingredients(mac_n_cheese, [butter, cheddar_cheese, milk, pasta, swiss_cheese]).
ingredients(mashed_potatoes, [butter, garlic, potatoes, salt]).
ingredients(oatmeal_raisin_cookies, [butter, eggs, flour, milk, oatmeal, raisins, white_sugar]).
ingredients(omelette, [eggs, peppers, swiss_cheese, tomatoes]).
ingredients(pancakes, [butter, eggs, flour, milk, syrup, white_sugar]).
ingredients(perogies, [cheddar_cheese, flour, potatoes, salt, sour_cream]).
ingredients(pizza, [basil, flour, marinara_sauce, mozzarella_cheese, pepperoni, salt, yeast]).
ingredients(potato_salad, [carrots, eggs, mayo, potatoes, peas]).
ingredients(potato_wedges, [canola_oil, ground_pepper, potatoes, salt]).
ingredients(poutine, [cheese_curds, gravy, potatoes, salt]).
ingredients(quesadillas, [cheddar_cheese, peppers, salsa, tortilla]).
ingredients(ramen, [eggs, garlic, noodles, sesame_oil, spring_onion]).
ingredients(shepherds_pie, [gravy, ground_beef, peas, potatoes, tomatoes]).
ingredients(shortbread, [butter, flour, white_sugar]).
ingredients(spaghetti, [ground_beef, marinara_sauce, parmesan_cheese, pasta, salt]).
ingredients(steak, [beef, butter, garlic, olive_oil, salt]).
ingredients(strawberry_rhubarb_pie, [butter, flour, rhubarb, shortening, strawberries, white_sugar]).
ingredients(sushi, [cucumbers, crab, rice, seaweed]).
ingredients(tacos, [avocado, cheddar_cheese, ground_beef, jalapeno_peppers, lettuce, sour_cream, tortilla]).
ingredients(taquitos, [cheddar_cheese, chicken, tortilla]).
ingredients(teriyaki_noodles, [chicken, noodles, salt, soy_sauce, spring_onions]).
ingredients(tuna_salad, [mayo, onions, pickles, tuna]).
ingredients(ribs, [bbq_sauce, ribs]).
ingredients(vegan_thai_noodles, [noodles, soy_sauce, garlic, peanuts, limes]).
ingredients(victorian_sponge_cake, [baking_powder, butter, eggs, flour, heavy_cream, jam, milk]).
ingredients(waffles, [butter, eggs, flour, milk, white_sugar]).

% RECIPES
% BREAKFAST
recipe(biscuit, breakfast).
recipe(cheese_biscuit, breakfast).
recipe(crepes, breakfast).
recipe(french_toast, breakfast).
recipe(fruit_salad, breakfast).
recipe(hash_browns, breakfast).
recipe(omelette, breakfast).
recipe(pancakes, breakfast).
recipe(waffles, breakfast).

% LUNCH
recipe(blt, lunch).
recipe(burrito, lunch).
recipe(burger, lunch).
recipe(cauliflower_bites, lunch).
recipe(cheeseburger, lunch).
recipe(chicken_caesar_salad, lunch).
recipe(chicken_nuggets, lunch).
recipe(cubanos, lunch).
recipe(grilled_cheese_sandwich, lunch).
recipe(fish_n_chips, lunch).
recipe(french_fries, lunch).
recipe(fried_chicken, lunch).
recipe(lasagna, lunch).
recipe(mac_n_cheese, lunch).
recipe(perogies, lunch).
recipe(potato_wedges, lunch).
recipe(poutine, lunch).
recipe(quesadillas, lunch).
recipe(sushi, lunch).
recipe(tacos, lunch).
recipe(taquitos, lunch).
recipe(tuna_salad, lunch).

% DINNER
recipe(burger, dinner).
recipe(burrito, dinner).
recipe(cheeseburger, dinner).
recipe(chicken_alfredo, dinner).
recipe(chicken_caesar_salad, dinner).
recipe(chicken_parmesan, dinner).
recipe(chicken_pot_pie, dinner).
recipe(eggplant_parmesan, dinner).
recipe(empanadas, dinner).
recipe(fajitas, dinner).
recipe(falafels, dinner).
recipe(lasagna, dinner).
recipe(mashed_potatoes, dinner).
recipe(perogies, dinner).
recipe(pizza, dinner).
recipe(potato_salad, dinner).
recipe(potato_wedges, dinner).
recipe(poutine, dinner).
recipe(ramen, dinner).
recipe(ribs, dinner).
recipe(shepherds_pie, dinner).
recipe(spaghetti, dinner).
recipe(steak, dinner).
recipe(sushi, dinner).
recipe(tacos, dinner).
recipe(taquitos, dinner).
recipe(teriyaki_noodles, dinner).
recipe(vegan_thai_noodles, dinner).

% DESSERT
recipe(apple_pie, dessert).
recipe(blueberry_pie, dessert).
recipe(brownies, dessert).
recipe(butter_tarts, dessert).
recipe(chocolate_cake, dessert).
recipe(chocolate_chip_cookies, dessert).
recipe(chocolate_lava_cake, dessert).
recipe(cream_puffs, dessert).
recipe(eclairs, dessert).
recipe(ice_cream, dessert).
recipe(macarons, dessert).
recipe(macaroons, dessert).
recipe(oatmeal_raisin_cookies, dessert).
recipe(shortbread, dinner).
recipe(strawberry_rhubarb_pie, dessert).
recipe(victorian_sponge_cake, dessert).

% VEGAN
recipe(cauliflower_bites, vegan).
recipe(falafels, vegan).
recipe(french_fries, vegan).
recipe(fruit_salad, vegan).
recipe(hash_browns, vegan).
recipe(potato_wedges, vegan).
recipe(vegan_thai_noodles, vegan).

% GLUTEN-FREE
recipe(burrito, gluten_free).
recipe(cauliflower_bites, gluten_free).
recipe(chicken_parmesan, gluten_free).
recipe(eggplant_parmesan, gluten_free).
recipe(falafels, gluten_free).
recipe(french_fries, gluten_free).
recipe(fruit_salad, gluten_free).
recipe(hash_browns, gluten_free).
recipe(ice_cream, gluten_free).
recipe(macaroons, gluten_free).
recipe(mashed_potatoes, gluten_free).
recipe(omelette, gluten_free).
recipe(potato_salad, gluten_free).
recipe(potato_wedges, gluten_free).
recipe(poutine, gluten_free).
recipe(steak, gluten_free).
recipe(sushi, gluten_free).
recipe(tuna_salad, gluten_free).
recipe(ribs, gluten_free).

% HIGH-CALORIE
recipe(crepes, high_calorie).
recipe(french_toast, high_calorie).
recipe(hash_browns, high_calorie).
recipe(pancakes, high_calorie).
recipe(waffles, high_calorie).
recipe(burrito, high_calorie).
recipe(burger, high_calorie).
recipe(cheeseburger, high_calorie).
recipe(chicken_nuggets, high_calorie).
recipe(cubanos, high_calorie).
recipe(grilled_cheese_sandwich, high_calorie).
recipe(fish_n_chips, high_calorie).
recipe(lasagna, high_calorie).
recipe(mac_n_cheese, high_calorie).
recipe(perogies, high_calorie).
recipe(potato_wedges, high_calorie).
recipe(poutine, high_calorie).
recipe(quesadillas, high_calorie).
recipe(tacos, high_calorie).
recipe(tuna_salad, high_calorie).
recipe(chicken_alfredo, high_calorie).
recipe(chicken_parmesan, high_calorie).
recipe(chicken_pot_pie, high_calorie).
recipe(empanadas, high_calorie).
recipe(fajitas, high_calorie).
recipe(lasagna, high_calorie).
recipe(mashed_potatoes, high_calorie).
recipe(pizza, high_calorie).
recipe(ramen, high_calorie).
recipe(ribs, high_calorie).
recipe(shepherds_pie, high_calorie).
recipe(spaghetti, high_calorie).
recipe(steak, high_calorie).
recipe(teriyaki_noodles, high_calorie).
recipe(apple_pie, high_calorie).
recipe(blueberry_pie, high_calorie).
recipe(brownies, high_calorie).
recipe(butter_tarts, high_calorie).
recipe(chocolate_cake, high_calorie).
recipe(chocolate_chip_cookies, high_calorie).
recipe(chocolate_lava_cake, high_calorie).
recipe(cream_puffs, high_calorie).
recipe(eclairs, high_calorie).
recipe(ice_cream, high_calorie).
recipe(macarons, high_calorie).
recipe(macaroons, high_calorie).
recipe(shortbread, high_calorie).
recipe(strawberry_rhubarb_pie, high_calorie).

% LOW-CALORIE
recipe(biscuit, low_calorie).
recipe(cheese_biscuit, low_calorie).
recipe(fruit_salad, low_calorie).
recipe(omelette, low_calorie).
recipe(blt, low_calorie).
recipe(cauliflower_bites, low_calorie).
recipe(chicken_caesar_salad, low_calorie).
recipe(sushi, low_calorie).
recipe(tuna_salad, low_calorie).
recipe(eggplant_parmesan, low_calorie).
recipe(falafels, low_calorie).
recipe(potato_salad, low_calorie).
recipe(vegan_thai_noodles, low_calorie).
recipe(oatmeal_raisin_cookies, low_calorie).
recipe(victorian_sponge_cake, low_calorie).
