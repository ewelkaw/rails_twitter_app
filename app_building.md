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

```
20. 
21.
22.
23.
24.
25.
