Specifications for the Rails Assessment
Specs:

 Using Ruby on Rails for the project
  * used Rails 6
 Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
  * User has many bugs
 Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
  * A task belongs to a user
 Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
  * A user has many bugs through programs 
 Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items 
 through Ingredients, Item has_many Recipes through Ingredients)
  * User has many bugs through programs and bugs has many users through programs
 The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
  * Programs have many attributes like name
 Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  * validations are there for the login/signup as well as on other models
 Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  * There are scope methods to collect users based on roles as well as other methods
 Include signup
 Include login
 Include logout
 Include third party signup/login (how e.g. Devise/OmniAuth)
  * Have github and google
 Include nested resource show or index (URL e.g. users/2/recipes)
  * user/:id/bugs
  * programs/:id/bugs
 Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
  * These are included for the bugs and others
 Include form display of validation errors (form URL e.g. /recipes/new)
  * They are displayed in .field_with_error tags
Confirm:

 The application is pretty DRY
  * refactored to make sure things were in order
 Limited logic in controllers
  * refactored this as well
 Views use helper methods if appropriate
  * Used a few
 Views use partials if appropriate
  * used a lot of partials. Realized my mistake later