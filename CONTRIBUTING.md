## Contributing

Use bundler to install all the development dependencies:

    % bundle

### Secret Token

You must store a cryptographically secure secret key in the environment
variable `WIFI_K9_SECRET_TOKEN`.

In a unix environment, use the following command each time you start a new
terminal session.

```console
% export WIFI_K9_SECRET_TOKEN=`rake secret`
```

### database.yml

Next you must create `config/database.yml` for the application to connect to
your database:

The minimum amount of configuration required to connect to sqlite3:

    default: &default
      adapter: sqlite3
      pool: 5
      timeout: 5000

    development:
      <<: *default
      database: db/development.sqlite3

    test:
      <<: *default
      database: db/test.sqlite3

To connect to postgresql:

    default: &default
      adapter: postgresql
      encoding: unicode
      pool: 5
      username: username
      password: password
      min_messages: warning

    development:
      <<: *default
      database: wifi_k9_development

    test:
      <<: *default
      database: wifi_k9_test

### Run the tests

All tests are written using RSpec. Make sure they all pass before working on
new features. Make sure to always __test first__ before writing any new code.

    % bundle exec rspec

