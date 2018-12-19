Specifications for the Rails Assessment 

Specs: 

- [X] Using Ruby on Rails for the project 
- [X] Include at least one has_many relationship - User has many Recipes and Chapter has_many Recipes 
- [X] Include at least one belongs_to relationship - Recipe belongs_to Chapter
- [X] Include at least on has_many through relationship - recipe has_many ingredients, through recipe_details 
- [X] The "through" part of the has_many through includes at least one user submittable attribute (recipe_details - instruction)
- [X] Include reasonable validations for simple model objects - User, Recipe, Ingredients, RecipeDetails and Chapter all have validations
- [X] Include class level ActiveRecord scope method (Recipe.search URL: /recipes/search)
- [X] Include a nested form writing to an associated model using a custom attribute writer (recipes/new ingredients_attributes)
- [X] Include a signup - Devise gem utilized 
- [X] Include login - Devise gem utilized 
- [X] Include logout - Devise gem utilized 
- [X] include third party signup/login - Devise/Omniauth for Google
- [X] Include nested resource show or index - chapters/:chapter_id/recipes/:id and chapters/:chapter_id/recipes
- [X] Include form display of validation errors - recipes/new - error messages show are displayed in new form 
Confirm: 
- [X] Application is pretty DRY 
- [X] Limited logic in controllers 
- [X] Views use helper methods if appropriate 
- [X] Views use partials if appropriate 
 

 Specifications for the Rails Assessment
Specs:

 
 
 
 
 Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
 Include form display of validation errors (form URL e.g. /recipes/new)
Confirm:

 The application is pretty DRY
 Limited logic in controllers
 Views use helper methods if appropriate
 Views use partials if appropriate