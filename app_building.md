### FILE ABOUT APP BUILDING STEP BY STEP

1. Static pages 
```bash
$ rails generate controller StaticPages home help
```

to reverse this command and man others (which we don't want to do here)"
```bash
$ rails destroy controller StaticPages home help
$ rails destroy model User

$ rails db:migrate
$ rails db:rollback

# to go to the beginning
$ rails db:migrate VERSION=0
```

2. Adding controllers to routes.rb
```
get "static_pages/help"
get "static_pages/home"
root 'application#hello'
```
3. Customise views

app/views/static_pages/home.html.erb

```html
<h1>Sample App</h1>
<p>
  This is the home page for the
  <a href="https://www.railstutorial.org/">Ruby on Rails Tutorial</a>
  sample application.
</p>
```

app/views/static_pages/help.html.erb

```html
<h1>Help</h1>
<p>
  Get help on the Ruby on Rails Tutorial at the
  <a href="https://www.railstutorial.org/help">Rails Tutorial Help page</a>.
  To get help on this sample app, see the
  <a href="https://www.railstutorial.org/book"><em>Ruby on Rails Tutorial</em>
  book</a>.
</p>
```

4. Testing

In test/controllers/static_pages_controller_test.rb there are some prepared tests, which need to be run by:
```bash 
$ rails db:migrate     # Necessary on some systems
$ rails test
```

5. Showing all routes
```bash
rails routes
```

6. Testing
```bash
$ spring stop
$ rails test
```

7. Merging changes to master and pushing to heroku
```bash
$ git add -A
$ git commit -m "Info about commit"
$ git checkout master
$ git merge static-pages
$ git push
$ spring stop
$ rails test
$ git push heroku
```

8. Advance testing

Add to test_helper.rb
```rails
require "minitest/reporters"
Minitest::Reporters.use!
```

Run in terminal:
```bash
$ bundle exec guard init
```

9. About CSS in app/views/layouts/application.html.erb:
```ruby
<%= stylesheet_link_tag 'application', media: 'all',
                                       'data-turbolinks-track': 'reload' %>
```
That means include application.css for all media types (including computer screens and printers).

10. Add application_helper in app/helpers/application_helper.rb:

```ruby
module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
```

Also in app/views/layouts/application.html.erb:
```html
<!DOCTYPE html>
<html>
  <head>
    <title><%= full_title(yield(:title)) %></title>
    <meta charset="utf-8">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag 'application', media: 'all',
                                           'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>
  <body>
    <%= yield %>
  </body>
</html>
```

11. Add to app/views/layouts/application.html.erb:
```html
<!DOCTYPE html>
<html>
  <head>
    <title><%= full_title(yield(:title)) %></title>
    <meta charset="utf-8">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag 'application', media: 'all',
                                           'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
    <!--[if lt IE 9]>
      <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/r29/html5.min.js">
      </script>
    <![endif]-->
  </head>
  <body>
    <header class="navbar navbar-fixed-top navbar-inverse">
      <div class="container">
        <%= link_to "sample app", '#', id: "logo" %>
        <nav>
          <ul class="nav navbar-nav navbar-right">
            <li><%= link_to "Home",   '#' %></li>
            <li><%= link_to "Help",   '#' %></li>
            <li><%= link_to "Log in", '#' %></li>
          </ul>
        </nav>
      </div>
    </header>
    <div class="container">
      <%= yield %>
    </div>
  </body>
</html>
```
Add also to app/views/static_pages/home.html.erb:
```html
<div class="center jumbotron">
  <h1>Welcome to the Sample App</h1>

  <h2>
    This is the home page for the
    <a href="https://www.railstutorial.org/">Ruby on Rails Tutorial</a>
    sample application.
  </h2>

  <%= link_to "Sign up now!", '#', class: "btn btn-lg btn-primary" %>
</div>

<%= link_to image_tag("rails.svg", alt: "Rails logo", width: "200"),
                      "https://rubyonrails.org/" %>
```

12. To use bootstrap add to Gemfile:
```ruby
gem 'bootstrap-sass', '3.4.1'
```

Then: `$ touch app/assets/stylesheets/custom.scss`
```css
@import "bootstrap-sprockets";
@import "bootstrap";

/* universal */

body {
  padding-top: 60px;
}

section {
  overflow: auto;
}

textarea {
  resize: vertical;
}

.center {
  text-align: center;
}

.center h1 {
  margin-bottom: 10px;
}

/* typography */

h1, h2, h3, h4, h5, h6 {
  line-height: 1;
}

h1 {
  font-size: 3em;
  letter-spacing: -2px;
  margin-bottom: 30px;
  text-align: center;
}

h2 {
  font-size: 1.2em;
  letter-spacing: -1px;
  margin-bottom: 30px;
  text-align: center;
  font-weight: normal;
  color: #777;
}

p {
  font-size: 1.1em;
  line-height: 1.7em;
}

/* header */

#logo {
  float: left;
  margin-right: 10px;
  font-size: 1.7em;
  color: #fff;
  text-transform: uppercase;
  letter-spacing: -1px;
  padding-top: 9px;
  font-weight: bold;
}

#logo:hover {
  color: #fff;
  text-decoration: none;
}

/* footer */

footer {
  margin-top: 45px;
  padding-top: 5px;
  border-top: 1px solid #eaeaea;
  color: #777;
}

footer a {
  color: #555;
}

footer a:hover {
  color: #222;
}

footer small {
  float: left;
}

footer ul {
  float: right;
  list-style: none;
}

footer ul li {
  float: left;
  margin-left: 15px;
}
```

Add to app/views/layouts/application.html.erb render parts:
```html
<!DOCTYPE html>
<html>
  <head>
    <title><%= full_title(yield(:title)) %></title>
    <meta charset="utf-8">
    <%= render 'layouts/rails_default' %>
    <%= render 'layouts/shim' %>
  </head>
  <body>
    <%= render 'layouts/header' %>
    <div class="container">
      <%= yield %>
      <%= render 'layouts/footer' %>
    </div>
  </body>
</html>
```
<%= render 'layouts/shim' %> the effect of this line is to look for a file called: app/views/layouts/_shim.html.erb

Add to app/views/layouts/_shim.html.erb:
```html
<!--[if lt IE 9]>
  <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/r29/html5.min.js">
  </script>
<![endif]-->
```

Add to app/views/layouts/_header.html.erb:
```html
<header class="navbar navbar-fixed-top navbar-inverse">
  <div class="container">
    <%= link_to "sample app", '#', id: "logo" %>
    <nav>
      <ul class="nav navbar-nav navbar-right">
        <li><%= link_to "Home",   '#' %></li>
        <li><%= link_to "Help",   '#' %></li>
        <li><%= link_to "Log in", '#' %></li>
      </ul>
    </nav>
  </div>
</header>
```

Add to app/views/layouts/_footer.html.erb:
```html
<footer class="footer">
  <small>
    The <a href="https://www.railstutorial.org/">Ruby on Rails Tutorial</a>
    by <a href="https://www.michaelhartl.com/">Michael Hartl</a>
  </small>
  <nav>
    <ul>
      <li><%= link_to "About",   '#' %></li>
      <li><%= link_to "Contact", '#' %></li>
      <li><a href="https://news.railstutorial.org/">News</a></li>
    </ul>
  </nav>
</footer>
```

13. Changing page routes:
```ruby
Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'#, as: "helf"
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
```

14. Add integration tests
```bash
$ rails generate integration_test site_layout
```
And add to test/integration/site_layout_test.rb:
```ruby
require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end
```
To run this tests: `rails test:integration`

15. Users controller
```bash
rails generate controller Users new
```

Modify routes.rb:
```ruby
Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'#, as: 'helf'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
```

Modify app/views/static_pages/home.html.erb:
```html
<div class="center jumbotron">
  <h1>Welcome to the Sample App</h1>

  <h2>
    This is the home page for the
    <a href="https://www.railstutorial.org/">Ruby on Rails Tutorial</a>
    sample application.
  </h2>

  <%= link_to "Sign up now!", signup_path, class: "btn btn-lg btn-primary" %>
</div>

<%= link_to image_tag("rails.svg", alt: "Rails logo", width: "200"),
                      "https://rubyonrails.org/" %>
```
Add to app/views/users/new.html.erb:
```html
<% provide(:title, 'Sign up') %>
<h1>Sign up</h1>
<p>This will be a signup page for new users.</p>
```

16. Modeling users
```bash
rails generate model User name:string email:string
rails db:migrate
```

To CRUD Users:
```ruby
### creating and manipulating objects
User.new
user = User.new(name: "Michael Hartl", email: "michael@example.com")
user.valid?
user.save
user
user.name
user.email
user.updated_at
User.create(name: "A Nother", email: "another@example.org")
foo = User.create(name: "Foo", email: "foo@bar.com")
foo.destroy


### querysets
User.find(1)    # user with ID 1
User.find(3)    # user with ID 3
User.find_by(email: "michael@example.com")
User.first
User.all

### updating objects
user.email = "mhartl@example.net"
user.save

user.email = "foo@bar.com"  # we need to save
user.reload.email   # there will be old email shown
user.created_at
user.updated_at
user.update(name: "The Dude", email: "dude@abides.org")   # update and the save in one step and checking validations
user.update_attribute(:name, "El Duderino")   # update and the save in one step but bypassing validations
```

17. To test model add to test/models/user_test.rb:
```ruby
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "      "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
```
Run: rails test:models

To avoid errors there need to be modification added to model user.rb:
```ruby
class User < ApplicationRecord
  validates :name,  presence: true, 
                    length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
end
```
If we want our search through DB to be faster, we need to add DB index:
```bash
$ rails generate migration add_index_to_users_email
```
Add to created migration:
```ruby
class AddIndexToUsersEmail < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :email, unique: true
  end
end

```
```bash
$ rails db:migrate
```

18. Modify User model
```ruby
class User < ApplicationRecord
  before_save { self.email = email.downcase } # or { email.downcase! } which works in place
  validates :name,  presence: true, 
                    length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
end
```
19. Adding a hashed password
Add to User model:
```ruby
has_secure_password
```

```bash
rails generate migration add_password_digest_to_users password_digest:string
rails db:migrate
```

There is migration for this model generated.
Add bcrypt to the Gemfile.
```ruby
gem 'bcrypt',         '3.1.13'
```
```bash 
bundle install
```

20. Add password validation:

Add to test/models/user_test.rb:
```ruby
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
```

And to User model:
```ruby
class User < ApplicationRecord
  before_validation { email.downcase! }
  validates :name,  presence: true, 
                    length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :password,  presence: true,
                        length: {minimum: 6}
  has_secure_password
end
```

To play with User model:
```bash
rails console
```
```ruby
User.create(name: "Michael Hartl", email: "michael@example.com",
            password: "foobar", password_confirmation: "foobar")
user = User.find_by(email: "michael@example.com")
user = User.find(1)
user.password_digest
user.authenticate("not_the_right_password")
!!user.authenticate("foobar") # !! converts an object to its corresponding boolean value

# create user with invalid password
user = User.new(name: "Foo Bar", email: "foo@invalid",
                 password: "dude", password_confirmation: "dude")
user.save
user.errors.full_messages # ["Email is invalid", "Password is too short (minimum is 6 characters)"]
```
21. Heroku push 
```bash
$ rails test
$ git push heroku
$ heroku run rails db:migrate
$ git checkout -b sign-up
$ heroku run rails console --sandbox
``` 

22. Add debug for dev environment app/views/layouts/application.html.erb:
```rails
<!DOCTYPE html>
<html>
  .
  .
  .
  <body>
    <%= render 'layouts/header' %>
    <div class="container">
      <%= yield %>
      <%= render 'layouts/footer' %>
      <%= debug(params) if Rails.env.development? %>
    </div>
  </body>
</html>
```

To check env:
```bash
rails console       # loads dev environment
rails console test  # loads test environment
heroku run rails console  # loads prod environment
Rails.env
```

23. Add Users resource

Add to resource.rb:
```
resources :users
```

Add to app/views/users/show.html.erb:
```ruby
<%= @user.name %>, <%= @user.email %>
```

Add to user controller show method:
```ruby
class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    debugger
  end
end
```

Try it:
```
http://localhost:3000/users/1
```
24. Add Gravatar image and a sidebar

Add to app/views/users/show.html.erb:
```ruby
<% provide(:title, @user.name) %>
<div class="row">
  <aside class="col-md-4">
    <section class="user_info">
      <h1>
        <%= gravatar_for @user %>
        <%= @user.name %>
      </h1>
    </section>
  </aside>
</div>
```

Add to app/helpers/users_helper.rb:
```ruby
module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
```
25. Signup form

Modify app/controllers/users_controller.rb:
```ruby
class UsersController < ApplicationController

  def show
    @user = User.find(user_params)
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
  end
end
```

Add to app/views/users/new.html.erb:
```html
<% provide(:title, "Sign up") %>
<h1>Sign up</h1>

<div class="row">
  <div class="col-md-6 col-md-offset-3">
    <%= form_with(model: @user, local: true) do |f| %>
      <%= render 'shared/error_messages' %>

      <%= f.label :name %>
      <%= f.text_field :name, class: 'form-control' %>

      <%= f.label :email %>
      <%= f.email_field :email, class: 'form-control' %>

      <%= f.label :password %>
      <%= f.password_field :password, class: 'form-control' %>

      <%= f.label :password_confirmation, "Confirmation" %>
      <%= f.password_field :password_confirmation, class: 'form-control' %>

      <%= f.submit "Create my account", class: "btn btn-primary" %>
    <% end %>
  </div>
</div>
```

Add to app/views/shared/_error_messages.html.erb:
```html
<% if @user.errors.any? %>
  <div id="error_explanation">
    <div class="alert alert-danger">
      The form contains <%= pluralize(@user.errors.count, "error") %>.
    </div>
    <ul>
    <% @user.errors.full_messages.each do |msg| %>
      <li><%= msg %></li>
    <% end %>
    </ul>
  </div>
<% end %>
```

26. Prepare create method for user controller
Modify app/controllers/users_controller.rb:
```ruby
class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # the same as redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
```
27. A test for invalid submission
```bash
rails generate integration_test users_signup
```

Add to test/integration/users_signup_test.rb:
```ruby
require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
  end
end
```

Add to app/views/layouts/application.html.erb:
```html
<!DOCTYPE html>
<html>
  .
  .
  .
  <body>
    <%= render 'layouts/header' %>
    <div class="container">
      <% flash.each do |message_type, message| %>
        <div class="alert alert-<%= message_type %>"><%= message %></div>
      <% end %>
      <%= yield %>
      <%= render 'layouts/footer' %>
      <%= debug(params) if Rails.env.development? %>
    </div>
    .
    .
    .
  </body>
</html>
```

28. SSL in production

Uncomment in config/environments/production.rb:
```ruby
Rails.application.configure do
  .
  .
  .
  # Force all access to the app over SSL, use Strict-Transport-Security,
  # and use secure cookies.
  config.force_ssl = true
  .
  .
  .
end
```
Modify config/puma.rb:
```ruby
# Puma configuration file.
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count
port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { ENV['RACK_ENV'] || "development" }
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }
workers ENV.fetch("WEB_CONCURRENCY") { 2 }
preload_app!
plugin :tmp_restart
```

We also need to make a so-called Procfile to tell Heroku to run a Puma process in production. We should add 
Procfile and code from below:
```ruby
web: bundle exec puma -C config/puma.rb
```
29. Sessions controller
```bash
$ rails generate controller Sessions new
```
Add to config/routes.rb:
```ruby
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
```
30. Login form

Add to app/views/sessions/new.html.erb:
```ruby
<% provide(:title, 'Log in') %>
<h1>Log in</h1>

<div class="row">
  <div class="col-md-6 col-md-offset-3">
    <%= form_with(url: login_path, scope: :session, local: true) do |f| %>

      <%= f.label :email %>
      <%= f.email_field :email %>

      <%= f.label :password %>
      <%= f.password_field :password %>

      <%= f.submit "Log in", class: "btn btn-primary" %>
    <% end %>
    <p>New user? <%= link_to "Sign up now!", signup_path %></p>
  </div>
</div>
```

Add to app/controllers/sessions_controller.rb:
```ruby
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      redirect '/'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
```
31. A flash test
```bash
$ rails generate integration_test users_login
```

Add to test/integration/users_login_test.rb:
```ruby
require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get login_path
    assert_response :success
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
```

32. Logging in

Add sessions that persist even after closing the browser to app/controllers/application_controller.rb:
```ruby
class ApplicationController < ActionController::Base
  include SessionsHelper
end
```

Add to app/helpers/sessions_helper.rb:
```
module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end
end
```

Add to app/controllers/sessions_controller.rb:
```ruby
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
```
33. Current user
Add to app/helpers/sessions_helper.rb:

```ruby
module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
```
34. Changing the layout links

Add to app/helpers/sessions_helper.rb:
```ruby
module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
end
```

Add to app/views/layouts/_header.html.erb
```ruby
<header class="navbar navbar-fixed-top navbar-inverse">
  <div class="container">
    <%= link_to "sample app", root_path, id: "logo" %>
    <nav>
      <ul class="nav navbar-nav navbar-right">
        <li><%= link_to "Home", root_path %></li>
        <li><%= link_to "Help", help_path %></li>
        <% if logged_in? %>
          <li><%= link_to "Users", '#' %></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              Account <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
              <li><%= link_to "Profile", current_user %></li>
              <li><%= link_to "Settings", '#' %></li>
              <li class="divider"></li>
              <li>
                <%= link_to "Log out", logout_path, method: :delete %>
              </li>
            </ul>
          </li>
        <% else %>
          <li><%= link_to "Log in", login_path %></li>
        <% end %>
      </ul>
    </nav>
  </div>
</header>
```
```bash
$ yarn add jquery@3.5.0 bootstrap@3.4.1
```

Add to config/webpack/environment.js:
```javascript
const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)

module.exports = environment
```

Modify app/javascript/packs/application.js:
```javascript
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
import "bootstrap"
```

35. Login upon signup

Modify app/controllers/users_controller.rb
```ruby
class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
```

Modify test/test_helper.rb
```ruby
ENV['RAILS_ENV'] ||= 'test'
.
.
.
class ActiveSupport::TestCase
  fixtures :all

  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end
end
```

Modify test/integration/users_signup_test.rb:
```ruby
require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  .
  .
  .
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
```
36. Logging out

Modify app/helpers/sessions_helper.rb:

```ruby
module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end
end
```

Modify app/views/layouts/_header.html.erb:
```html
<header class="navbar navbar-fixed-top navbar-inverse">
  <div class="container">
    <%= link_to "sample app", root_path, id: "logo" %>
    <nav>
      <ul class="nav navbar-nav navbar-right">
        <li><%= link_to "Home", root_path %></li>
        <li><%= link_to "Help", help_path %></li>
        <% if logged_in? %>
          <li><%= link_to "Users", '#' %></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              Account <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
              <li><%= link_to "Profile", current_user %></li>
              <li><%= link_to "Settings", '#' %></li>
              <li class="divider"></li>
              <li>
                <%= link_to "Log out", logout_path, method: :delete %>
              </li>
            </ul>
          </li>
        <% else %>
          <li><%= link_to "Log in", login_path %></li>
        <% end %>
      </ul>
    </nav>
  </div>
</header>
```

Modify app/controllers/sessions_controller.rb:
```ruby
class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
```

Modify test/integration/users_login_test.rb
```ruby
require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "login with valid email/invalid password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email:    @user.email,
                                          password: "invalid" } }
    assert_not is_logged_in?
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end
```
37. Advanced login
```bash
$ rails generate migration add_remember_digest_to_users remember_digest:string
$ rails db:migrate
```

Modify app/models/user.rb:
```ruby
class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
```

38. Login with remembering

Modify app/controllers/sessions_controller.rb:
```ruby

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session
      log_in user
      remember user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
```

Modify app/helpers/sessions_helper.rb:
```ruby
module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the current logged-in user (if any). This is acctually in application_helper
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.encrypted[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    reset_session
    @current_user = nil
  end
```
39. “Remember me” checkbox

Add to app/views/sessions/new.html.erb:

```html
      <%= f.label :remember_me, class: "checkbox inline" do %>
        <%= f.check_box :remember_me %>
        <span>Remember me on this computer</span>
      <% end %>
```

Add to test/test_helper.rb:
```ruby
  # Log in as a particular user.
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest

  # Log in as a particular user.
  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember_me: remember_me } }
  end
```

Modify app/controllers/sessions_controller.rb:
```ruby
class SessionsController < ApplicationController

  def new
  end

  def create
      user = User.find_by(email: session_params[:email])
      if user && user.authenticate(session_params[:password])
        reset_session
        log_in user
        remember user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to current_user #  user_url(user)
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
```

Update test/test_helper.rb:

```ruby
ENV['RAILS_ENV'] ||= 'test'
.
.
.
class ActiveSupport::TestCase
  fixtures :all

  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Log in as a particular user.
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest

  # Log in as a particular user.
  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember_me: remember_me } }
  end
end
```

Add to test/integration/users_login_test.rb:
```ruby
require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

 def setup
   @user = users(:michael)
 end
 .
 .
 .
 test "login with remembering" do
   log_in_as(@user, remember_me: '1')
   assert_not_empty cookies[:remember_token]
 end

 test "login without remembering" do
   # Log in to set the cookie.
   log_in_as(@user, remember_me: '1')
   # Log in again and verify that the cookie is deleted.
   log_in_as(@user, remember_me: '0')
   assert_empty cookies[:remember_token]
 end
end
```

Add file test/helpers/sessions_helper_test.rb:
```ruby

```

40. User edit form

Add to app/controllers/users_controller.rb:
```ruby
class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        flash[:success] = "Profile updated"
        redirect_to @user
    else
      render 'edit'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
```

Add in location file app/views/users/edit.html.erb:
```html
<% provide(:title, "Edit user") %>
<h1>Update your profile</h1>

<div class="row">
  <div class="col-md-6 col-md-offset-3">
    <%= form_with(model: @user, local: true) do |f| %>
      <%= render 'shared/error_messages' %>

      <%= f.label :name %>
      <%= f.text_field :name, class: 'form-control' %>

      <%= f.label :email %>
      <%= f.email_field :email, class: 'form-control' %>

      <%= f.label :password %>
      <%= f.password_field :password, class: 'form-control' %>

      <%= f.label :password_confirmation, "Confirmation" %>
      <%= f.password_field :password_confirmation, class: 'form-control' %>

      <%= f.submit "Save changes", class: "btn btn-primary" %>
    <% end %>

    <div class="gravatar_edit">
      <%= gravatar_for @user %>
      <a href="https://gravatar.com/emails" target="_blank">change</a>
    </div>
  </div>
</div>
```

We need to add settings to app/views/layouts/_header.html.erb:
```html
<header class="navbar navbar-fixed-top navbar-inverse">
  <div class="container">
    <%= link_to "sample app", root_path, id: "logo" %>
    <nav>
      <ul class="nav navbar-nav navbar-right">
        <li><%= link_to "Home", root_path %></li>
        <li><%= link_to "Help", help_path %></li>
        <% if logged_in? %>
          <li><%= link_to "Users", '#' %></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              Account <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
              <li><%= link_to "Profile", current_user %></li>
              <li><%= link_to "Settings", edit_user_path(current_user) %></li>
              <li class="divider"></li>
              <li>
                <%= link_to "Log out", logout_path, method: :delete %>
              </li>
            </ul>
          </li>
        <% else %>
          <li><%= link_to "Log in", login_path %></li>
        <% end %>
      </ul>
    </nav>
  </div>
</header>
```

How to test it?
```bash
$ rails generate integration_test users_edit
```

Add to test/integration/users_edit_test.rb:
```ruby
require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    assert_template 'users/edit'
  end

  test "successful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.emai
  end

end
```

We neet to modify also app/models/user.rb to accept also empty passwords:
```ruby
  validates :password,  presence: true,
                        length: {minimum: 6}, 
                        allow_nil: true
```
41. Authorization - control what users can do

Add to app/controllers/users_controller.rb:
```ruby

class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

...
  def edit
      @user = User.find(params[:id])
      if current_user != @user
        redirect_to root_url
      end
    end
  
    def update
      @user = User.find(params[:id])
      if current_user != @user
          redirect_to root_url
      elsif @user.update(user_params)
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        render 'edit'
      end
   
 
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end


    end
```

Modify test/controllers/users_controller_test.rb:
```ruby
require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user       = users(:michael)
    @other_user = users(:archer)
  end
  .
  .
  .
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end
end
```
42. Users index

Add to test/controllers/users_controller_test.rb:
```ruby
require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user       = users(:michael)
    @other_user = users(:archer)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end
  .
  .
  .
end
```

Add to app/controllers/users_controller.rb:
```ruby
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  .
  .
  .
end
```

Add to app/views/users/index.html.erb:
```html
       <% provide(:title, 'All users') %>
       <h1>All users</h1>
       
       <ul class="users">
         <% @users.each do |user| %>
           <li>
             <%= gravatar_for user, size: 50 %>
             <%= link_to user.name, user %>
           </li>
         <% end %>
       </ul>
```

Modify app/views/layouts/_header.html.erb:
```html
 <header class="navbar navbar-fixed-top navbar-inverse">
         <div class="container">
           <%= link_to "sample app", root_path, id: "logo" %>
           <nav>
             <ul class="nav navbar-nav navbar-right">
               <li><%= link_to "Home", root_path %></li>
               <li><%= link_to "Help", help_path %></li>
               <% if logged_in? %>
                 <li><%= link_to "Users", users_path %></li>
                 <li class="dropdown">
                   <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                     Account <b class="caret"></b>
                   </a>
                   <ul class="dropdown-menu">
                     <li><%= link_to "Profile", current_user %></li>
                     <li><%= link_to "Settings", edit_user_path(current_user) %></li>
                     <li class="divider"></li>
                     <li>
                       <%= link_to "Log out", logout_path, method: :delete %>
                     </li>
                   </ul>
                 </li>
               <% else %>
                 <li><%= link_to "Log in", login_path %></li>
               <% end %>
             </ul>
           </nav>
         </div>
       </header>
```
      
Add faker to Gemfile and install it, then add to db/seeds.rb:
```ruby
# Create a main sample user.
User.create!(name:  "Example User",
email: "example@railstutorial.org",
password:              "foobar",
password_confirmation: "foobar")

# Generate a bunch of additional users.
99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name:  name,
email: email,
password:              password,
password_confirmation: password)
end
```

Then:
```bash
$ rails db:migrate:reset
$ rails db:seed
```

43. Pagination
Add to Gemfile `will_paginate` and `bootstrap-will_paginate` and modify app/views/users/index.html.erb:
```html
<% provide(:title, 'All users') %>
<h1>All users</h1>

<%= will_paginate %>

<ul class="users">
  <% @users.each do |user| %>
    <li>
      <%= gravatar_for user, size: 50 %>
      <%= link_to user.name, user %>
    </li>
  <% end %>
</ul>

<%= will_paginate %>
```

Change also app/controllers/users_controller.rb:
```ruby
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  .
  .
  .
  def index
    @users = User.paginate(page: params[:page])
  end
```

Add tests to test/integration/users_index_test.rb by `rails generate integration_test users_index`:
```ruby
 require 'test_helper'
 
 class UsersIndexTest < ActionDispatch::IntegrationTest
 
   def setup
     @user = users(:michael)
   end
 
   test "index including pagination" do
     log_in_as(@user)
     get users_path
     assert_template 'users/index'
     assert_select 'div.pagination'
     User.paginate(page: 1).each do |user|
       assert_select 'a[href=?]', user_path(user), text: user.name
     end
   end
 end
```

44. Administrative users

We need an admin :
```bash
$ rails generate migration add_admin_to_users admin:boolean
$ rails db:migrate
```

Then add to seeds.rb for User.create `admin: true` and provide:
```bash
$ rails db:migrate:reset
$ rails db:seed
```

Modify test/controllers/users_controller_test.rb:
```ruby
require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user       = users(:michael)
    @other_user = users(:archer)
  end
  .
  .
  .
  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), params: {
                                    user: { password:              "password",
                                            password_confirmation: "password",
                                            admin: FILL_IN } }
    assert_not @other_user.FILL_IN.admin?
  end
  .
  .
  .
end
```

Add to app/controllers/users_controller.rb:
```ruby
class UsersController < ApplicationController
 before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
 before_action :admin_user,     only: :destroy
 .
 .
 .
 def destroy
   User.find(params[:id]).destroy
   flash[:success] = "User deleted"
   redirect_to users_url
 end

 private
 .
 .
 .
# Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
```

Add to test/controllers/users_controller_test.rb:
```ruby
require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

 def setup
   @user       = users(:michael)
   @other_user = users(:archer)
 end
 .
 .
 .
 test "should redirect destroy when not logged in" do
   assert_no_difference 'User.count' do
     delete user_path(@user)
   end
   assert_redirected_to login_url
 end

 test "should redirect destroy when logged in as a non-admin" do
   log_in_as(@other_user)
   assert_no_difference 'User.count' do
     delete user_path(@user)
   end
   assert_redirected_to root_url
 end
end
```

Modify also test/integration/users_index_test.rb:
```ruby
require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin     = users(:michael)
    @non_admin = users(:archer)
  end

  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'delete'
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
end
```
 
PUSHING TO HEROKU (from master):
```bash
$ git pull
$ rails test
$ git push heroku
$ heroku pg:reset DATABASE
$ heroku run rails db:migrate
$ heroku run rails db:seed

```

45. Account activation
```bash
$ rails generate controller AccountActivations
$ rails generate migration add_activation_to_users activation_digest:string activated:boolean activated_at:datetime
$ rails db:migrate
```

Add to config/routes.rb:
```ruby
Rails.application.routes.draw do
 root   'static_pages#home'
 get    '/help',    to: 'static_pages#help'
 get    '/about',   to: 'static_pages#about'
 get    '/contact', to: 'static_pages#contact'
 get    '/signup',  to: 'users#new'
 get    '/login',   to: 'sessions#new'
 post   '/login',   to: 'sessions#create'
 delete '/logout',  to: 'sessions#destroy'
 resources :users
 resources :account_activations, only: [:edit]
end
```

Modify app/models/user.rb:
```ruby
class User < ApplicationRecord
 attr_accessor :remember_token, :activation_token
 before_save   :downcase_email
 before_create :create_activation_digest
 validates :name,  presence: true, length: { maximum: 50 }
 .
 .
 .
 private

   # Converts email to all lower-case.
   def downcase_email
     self.email = email.downcase
   end

   # Creates and assigns the activation token and digest.
   def create_activation_digest
     self.activation_token  = User.new_token
     self.activation_digest = User.digest(activation_token)
   end
end
```

Modify db/seeds.rb:
```ruby
# Create a main sample user.
User.create!(name:  "Example User",
            email: "example@railstutorial.org",
            password:              "foobar",
            password_confirmation: "foobar",
            admin:     true,
            activated: true,
            activated_at: Time.zone.now)

# Generate a bunch of additional users.
99.times do |n|
 name  = Faker::Name.name
 email = "example-#{n+1}@railstutorial.org"
 password = "password"
 User.create!(name:  name,
             email: email,
             password:              password,
             password_confirmation: password,
             activated: true,
             activated_at: Time.zone.now)
end
```

```bash
$ rails db:migrate:reset
$ rails db:seed
```

Add mailer templates:
```bash
$ rails generate mailer UserMailer account_activation password_reset
```

Modify generated mailer in app/mailers/user_mailer.rb:
```ruby
class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
```
 

Modify generated User mailer in app/mailers/application_mailer.rb:
```ruby
class ApplicationMailer < ActionMailer::Base
  default from: "noreply@example.com"
  layout 'mailer'
end
```
 
To get the email previews modify config/environments/development.rb:
```ruby
  config.action_mailer.raise_delivery_errors = false

  host = 'localhost:3000'                     # Local server
  # Use this if developing on localhost.
  config.action_mailer.default_url_options = { host: host, protocol: 'http' }
```

Update test/mailers/previews/user_mailer_preview.rb:
```ruby
# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    UserMailer.password_reset
  end
end
```

Modify test/mailers/user_mailer_test.rb
```ruby
require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

 test "account_activation" do
   user = users(:michael)
   user.activation_token = User.new_token
   mail = UserMailer.account_activation(user)
   assert_equal "Account activation", mail.subject
   assert_equal [user.email], mail.to
   assert_equal ["noreply@example.com"], mail.from
   assert_match user.name,               mail.body.encoded
   assert_match user.activation_token,   mail.body.encoded
   assert_match CGI.escape(user.email),  mail.body.encoded
 end
end
```

Add to config/environments/test.rb:
```ruby
Rails.application.configure do
 .
 .
 .
 config.action_mailer.delivery_method = :test
 config.action_mailer.default_url_options = { host: 'example.com' }
 .
 .
 .
end
```

Update app/controllers/users_controller.rb:
```ruby

       class UsersController < ApplicationController
         .
         .
         .
         def create
           @user = User.new(user_params)
           if @user.save
             UserMailer.account_activation(@user).deliver_now
             flash[:info] = "Please check your email to activate your account."
             redirect_to root_url
           else
             render 'new'
           end
         end
         .
         .
         .
       end
```

Comment two lines in test/integration/users_signup_test.rb
```ruby
require 'test_helper'
     
     class UsersSignupTest < ActionDispatch::IntegrationTest
     
       test "invalid signup information" do
         get signup_path
         assert_no_difference 'User.count' do
           post users_path, params: { user: { name:  "",
                                              email: "user@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }
         end
         assert_template 'users/new'
         assert_select 'div#error_explanation'
         assert_select 'div.field_with_errors'
       end
     
       test "valid signup information" do
         get signup_path
         assert_difference 'User.count', 1 do
           post users_path, params: { user: { name:  "Example User",
                                              email: "user@example.com",
                                              password:              "password",
                                              password_confirmation: "password" } }
         end
         follow_redirect!
         # assert_template 'users/show'
         # assert is_logged_in?
       end
     end
```
        
Modify authenticated? method app/models/user.rb:
```ruby
  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
```
46.
47.
48.
49.
50.