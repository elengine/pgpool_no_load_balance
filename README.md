# PgpoolNoLoadBalance

This gem exists for you to use [Pgpool-II's load balancing](https://www.pgpool.net/docs/latest/en/html/runtime-config-load-balancing.html) feature.

If you don't want a query that qualifies for the load balancing to be load balanced by Pgpool-II, you can put arbitrary comment(`/*NO LOAD BALANCE*/` is usually used) before the SELECT statement. This will disable the load balance of the particular query and Pgpool-II will send it to the master node (the primary node in Master Slave mode).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pgpool_no_load_balance'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pgpool_no_load_balance

## Usage

### pgpool_nlb method

Using the `pgpool_nlb` method will add a comment to the SQL.
```rb
irb(main):001:0> User.pgpool_nlb.all
  /*NO LOAD BALANCE*/ SELECT "users".* FROM "users" LIMIT $1  [["LIMIT", 11]]
```

### unscope

Can remove the scope with the unscope method.
```rb
irb(main):001:0> user_relation = User.where(name: 'elengine').pgpool_nlb

irb(main):002:0> user_relation.count
  /*NO LOAD BALANCE*/ SELECT COUNT(*) FROM "users" WHERE "users"."name" = $1  [["name", "elengine"]]

irb(main):003:0> user_relation.unscope(:pgpool_nlb).order(:id).limit(3)
  SELECT "users".* FROM "users" WHERE "users"."name" = $1 ORDER BY "users"."id" ASC LIMIT $2  [["name", "elengine"], ["LIMIT", 3]]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/elengine/pgpool_no_load_balance. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/elengine/pgpool_no_load_balance/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PgpoolNoLoadBalance project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/elengine/pgpool_no_load_balance/blob/master/CODE_OF_CONDUCT.md).
