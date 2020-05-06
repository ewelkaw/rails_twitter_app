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

6. 