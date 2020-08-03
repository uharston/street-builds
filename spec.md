# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
-----------------------------------------------------------------------------

- [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 

    => User as:owner has_many :owned_project_cars

-----------------------------------------------------------------------------

- [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

    => ProjectCar belongs_to :user, as:owner 

-----------------------------------------------------------------------------

- [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

=> User has_many :comments, through: :cars

--------------------------------------------------------------------------------

- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

=>  Board has_many :cars, through: :pins 
    Car has_many :boards, through: :pins 

-------------------------------------------------------------------------------

- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

-----------------------------------------------------------------------------

- [X] Include signup
- [X] Include login
- [X] Include logout
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)

-----------------------------------------------------------------------------

- [X] Include nested resource show or index (URL e.g. users/2/recipes)

http://localhost:3000/users/7/boards

-----------------------------------------------------------------------------

- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)

http://localhost:3000/cars/2/pins/new

-----------------------------------------------------------------------------

- [X] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate
- [X] Make it not ugly i.e. CSS please. 

- My Cars
- My Boards 
- Settings 
- Logout




FILTER CODE 

        <span class="w3-margin-right">Filter:</span> 
        <button class="w3-button w3-black">ALL</button>
        <%= link_to "ALL", cars_path, method: :post,  class: "w3-button w3-black" %>

        <button class="w3-button w3-white"><i class="fa fa-diamond w3-margin-right"></i>Design</button>
        <button class="w3-button w3-white w3-hide-small"><i class="fa fa-photo w3-margin-right"></i>Photos</button>
        <button class="w3-button w3-white w3-hide-small"><i class="fa fa-map-pin w3-margin-right"></i>Art</button>

DROPDOWN MENU CODE 

            <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button"><img src="<%=current_user.image_href>" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <%= link_to "My Cars", user_cars_path(current_user), class="w3-bar-item w3-button" %>
        <%= link_to "My Boards", user_boards_path(current_user), class="w3-bar-item w3-button"%>
        <%= link_to "Settings", user_cars_path(current_user), class="w3-bar-item w3-button" %>
        <%= link_to "Log Out, logout_path, class="w3-bar-item w3-button" %>
      </div>
      </div>
        <%= image_tag current_user.images, style: "width:65px;", class: "w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity" %>
        <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>