## Synopsis

A very simple attraction manager.

## Installation

First do the typical bundle install:

```shell
bundle install
```

Rename config/database.yml.example to config/database.yml.

```shell
mv config/database.yml.example config/database.yml
```

You should provide the username and password of your PostgreSQL database, like the example suggests. After that you should create a role with the LOGIN and CREATEDB permissions. See [CREATE_ROLE](http://www.postgresql.org/docs/8.1/static/sql-createrole.html) command.

Last but not least, initialize your database.

```shell
rake db:create
rake db:migrate
rake db:seed
```

Finally, you can start your Rails app :)

```shell
rails s
```

## Tests

You can run the tests with the basic rspec command:

```shell
rspec
```

## License

See [LICENSE](LICENSE)