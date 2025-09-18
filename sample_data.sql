-- Users
INSERT INTO User_Account(full_name, email, protein_target_g, kcal_target)
VALUES ('Shawan','shawan@example.com', 150, 2800);

-- Food Catalog (approximate values)
INSERT INTO FoodItem(name, kcal_per_100g, protein_g_100g, carbs_g_100g, fat_g_100g)
VALUES ('Chicken Breast (raw)', 165, 31, 0, 3.6);
INSERT INTO FoodItem(name, kcal_per_100g, protein_g_100g, carbs_g_100g, fat_g_100g)
VALUES ('White Rice (cooked)', 130, 2.7, 28, 0.3);
INSERT INTO FoodItem(name, kcal_per_100g, protein_g_100g, carbs_g_100g, fat_g_100g)
VALUES ('Whole Egg', 143, 12.6, 1.1, 9.9);
INSERT INTO FoodItem(name, kcal_per_100g, protein_g_100g, carbs_g_100g, fat_g_100g)
VALUES ('Olive Oil', 884, 0, 0, 100);
INSERT INTO FoodItem(name, kcal_per_100g, protein_g_100g, carbs_g_100g, fat_g_100g)
VALUES ('Oats (dry)', 389, 16.9, 66.3, 6.9);
INSERT INTO FoodItem(name, kcal_per_100g, protein_g_100g, carbs_g_100g, fat_g_100g)
VALUES ('Milk (cow, 3.5%)', 61, 3.2, 4.8, 3.3);

-- Meals for the last 2 days
-- Assume SYSDATE is "today"; create meals for yesterday and today.

-- Meal Items

-- Exercises & Workouts
INSERT INTO Exercise(name, muscle_group) VALUES ('Barbell Bench Press','Chest');
INSERT INTO Exercise(name, muscle_group) VALUES ('Back Squat','Legs');