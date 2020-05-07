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

