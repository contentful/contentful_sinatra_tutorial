# Creating your own Contentful and Sinatra Application

## Create your Sinatra application

Create an `app.rb` file:

```ruby
require 'sinatra'

get '/' do
  'Hello world!'
end
```

## Add Contentful to your project dependencies

On your project's `Gemfile` add:

```ruby
gem 'contentful'
```

## Ways to include Contentful in your project:

### Contentful as a function

In the case that your app is simple, and has only 1 Sinatra class. You can add Contentful as a function like follows:

```ruby
def contentful(space, token)
  @client ||= Contentful::Client.new(
    space: space,
    access_token: token,
    dynamic_entries: :auto,
    raise_errors: true
  )
end
```

This will provide you with a `contentful` client for your space, which will be available in the local scope.

Then to fetch your entries and use them:

```ruby
get '/' do
  erb :my_erb_template, locals: { entries: contentful(ENV['CONTENTFUL_SPACE'], ENV['CONTENTFUL_TOKEN']).entries }
end
```

### Contentful as a Helper

If your application grows bigger and you want to modularize, you may want to consider to move Contentful to it's own HelperClass.
This method allows for better code separation, and makes reusing code a lot easier.

To use this method, you need to follow then next simple steps:

* Create a ContentfulHelper module:

```ruby
module ContentfulHelper
  def contentful(space, token)
    @client ||= Contentful::Client.new(
      space: space,
      access_token: token,
      dynamic_entries: :auto,
      raise_errors: true
    )
  end
end
```

* In your Sinatra App, include the module as a helper:

```ruby
class MyApp < Sinatra::Application
  helpers ContentfulHelper

  get '/' do
    # Now you can fetch your entries here
    erb :my_erb_template, locals: { entries: contentful(ENV['CONTENTFUL_SPACE'], ENV['CONTENTFUL_TOKEN']).entries }
  end
end
```

With this approach, if you have multiple Sinatra Sub-applications, you can add the Contentful helper for any class that needs it.

## How to use Contentful Entries in Views

You can check how we use them in our example application [here](./templates/products.slim). The example uses `slim` as a template engine,
but the code should be easily transferable to any other engine.

## This is just the beggining

This is just a very simple tutorial to get things running, but every project has different needs, and we want to provide you
with the best solutions we can.

## Providing Feedback

If you want to provide feedback or improve this tutorial, feel free to submit a Pull Request.
