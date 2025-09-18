BEGIN EXECUTE IMMEDIATE 'DROP VIEW vw_daily_macros';        EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP VIEW vw_meal_totals';         EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP VIEW vw_meal_macros';         EXCEPTION WHEN OTHERS THEN NULL; END;
/
-- Per MEAL ITEM nutrient contribution (computed from grams)
CREATE OR REPLACE VIEW vw_meal_macros AS
SELECT
  mi.meal_item_id,
  mi.meal_id,
  mi.food_id,
  mi.grams,
  ROUND((mi.grams/100) * f.kcal_per_100g, 1)  AS kcal,
  ROUND((mi.grams/100) * f.protein_g_100g, 2) AS protein_g,
  ROUND((mi.grams/100) * f.carbs_g_100g, 2)   AS carbs_g,
  ROUND((mi.grams/100) * f.fat_g_100g, 2)     AS fat_g
FROM MealItem mi
JOIN FoodItem f ON f.food_id = mi.food_id;

-- Per MEAL totals
CREATE OR REPLACE VIEW vw_meal_totals AS
SELECT
  m.meal_id,
  m.user_id,
  TRUNC(m.meal_dt) AS meal_day,
  m.meal_type,
  SUM(v.kcal)     AS meal_kcal,
  SUM(v.protein_g) AS meal_protein_g,
  SUM(v.carbs_g)   AS meal_carbs_g,
  SUM(v.fat_g)     AS meal_fat_g
FROM Meal m
LEFT JOIN vw_meal_macros v ON v.meal_id = m.meal_id
GROUP BY m.meal_id, m.user_id, TRUNC(m.meal_dt), m.meal_type;

-- Per USER per DAY totals
CREATE OR REPLACE VIEW vw_daily_macros AS
SELECT
  mt.user_id,
  mt.meal_day,
  SUM(mt.meal_kcal)     AS day_kcal,
  SUM(mt.meal_protein_g) AS day_protein_g,
  SUM(mt.meal_carbs_g)   AS day_carbs_g,
  SUM(mt.meal_fat_g)     AS day_fat_g
FROM vw_meal_totals mt
GROUP BY mt.user_id, mt.meal_day;