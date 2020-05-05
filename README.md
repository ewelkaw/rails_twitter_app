
This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](https://www.railstutorial.org/)
(6th Edition)
by [Michael Hartl](https://www.michaelhartl.com/).

## License

All source code in the [Ruby on Rails Tutorial](https://www.railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```bash
$ bundle update
$ bundle install
$ bundle install --without production
```

Next, migrate the database:

```bash
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```bash
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```bash
$ rails server
$ rails s
```

For more information, see the
[*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).

Rwgular heroku deployment
```bash
$ git commit -am "Info about commit"
$ git push
$ heroku create
$ git push heroku master
$ heroku logs         # to see the most recent events
$ heroku logs --tail  # to see events as they happen, Ctrl-C to quit
```
