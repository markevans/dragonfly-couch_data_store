# Dragonfly::CouchDataStore

Couch data store for use with the [Dragonfly](http://github.com/markevans/dragonfly) gem.

## Gemfile

```ruby
gem 'dragonfly-couch_data_store'
```

## Usage

Configuration (with default options):

```ruby
require 'dragonfly/couch_data_store'

Dragonfly.app.configure do
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
:host              # default 'localhost'
:port              # default 5984
:database          # default 'dragonfly'
:username          # not needed in 'admin party' mode
:password          # not needed in 'admin party' mode
```

### Serving directly from Couch

```ruby
Dragonfly.app.remote_url_for('some/uid')
```

or

```ruby
my_model.attachment.remote_url
```
