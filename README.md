# Dragonfly::CouchDataStore

Couch data store for use with the (http://github.com/markevans/dragonfly)[Dragonfly] gem.

## Gemfile

```ruby
gem 'dragonfly-couch_data_store'
```

## Usage

In your dragonfly config block (with default options):

```ruby
Dragonfly.app.configure
  # ...

  datastore :couch

  # ...
end
```

Or with options:

```ruby
datastore :couch, username: 'potatoman', password: 'spudulike'
```

### Available options

```ruby
host              # default 'localhost'
port              # default 5984
database          # default 'dragonfly'
username          # not needed in 'admin party' mode
password          # not needed in 'admin party' mode
```

