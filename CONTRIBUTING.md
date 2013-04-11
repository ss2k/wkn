## Contributing

User bundler to install all the development dependencies:

```console
% bundle
```

Next you must create `config/database.yml` for the application to connect to
your database:

The simplest path is to use sqlite3, the contents could look like this:

```yaml
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
```

Lastly, you must store a secret token in `config/wifi_k9_config.yml`. First
generate a secret token:

```console
% rake secret
e756d00c56dc20d4ed4f7d9ca01aa73add7d0889af7c77c910085f11348dc075957b4408727e05cb20a27baa77173763591e0a6cf7e4433e038daf417b80c161
```

Then create the file. Its contents should look like this:

```yaml
---
secret_token: e756d00c56dc20d4ed4f7d9ca01aa73add7d0889af7c77c910085f11348dc075957b4408727e05cb20a27baa77173763591e0a6cf7e4433e038daf417b80c161
```

Run the tests and make sure they all pass:

```console
% bundle exec rspec
```

### PostgreSQL

If you want to use postgesql instead of sqlite3, you must first create a role
with attributes `CREATEDB` and `LOGIN`.

```console
% psql postgres
postgres=> CREATE ROLE username WITH CREATEDB LOGIN PASSWORD 'password';
CREATE ROLE
```

Here I've created the role and assigned privileges to create databases and
login.  A password of 'password' was also set as a credential for logging in.

NOTE: You can set the authentication method to `trust` in `pg_hba.conf` if you
prefer to avoid dealing with passwords altogether.

Next, create `config/database.yml` with the role you just created:

```yaml
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
```

