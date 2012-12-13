# Intro

If you are like me you have probably avoided testing your JS simply because it seemed too hard.
Automating the testing of your JS can seem a daunting, especially when you aren't in the classic rails environment.
This tiny Padrino example app illustrates how to setup an automated testing environment for js using and guard-jasmine.

*Note:* These docs are a work in progress.

# Prerequisites

You'll need PhantomJS installed, in your path and working. 

# How it works

The underlying tech in an automated JS testing environment is;

1. A page serving up specs.

  This means you just serve up your specs from /jasmine and point a phantomjs script it.
  Rails gems that work with jasmine are usually nothing more than engines that automatically mount your JS specs at a
  url and then run a phantomjs or selenemium driver against the url.
  
2. Some scripts that parse the page and serve up the results of Jasmine specs to your console.

Given these two facts it's not hard to see how you can build the same thing using sinatra/padrino or any other Rack 
powered framework. This app simply utilizes [padrino-sprockets](http://github.com/bookworm/padrino-sprocket) and a simple 
controller + view to serve up

# Using in your app

1. Install and configure [padrino-sprockets](https://github.com/bookworm/padrino-sprockets) + [padrino-assethelpers](https://github.com/bookworm/padrino-assethelpers)

Add something like this to your App.rb

```ruby
  register Padrino::Sprockets   
  register Padrino::AssetHelpers

  set :stylesheets_folder, :css
  set :javascripts_folder, :js

  assets do    
    digest false  
    handle_stylesheets false  
    assets_folder '/public'
    append_path   '../assets/js'  
    append_path   '../spec/javascripts'
    append_path   '../vendor/assets/js'   
  end  
```

2. Copy vendor/assets, assets/css, app/views/jasmine and spec/javascripts to your app
3. Open up app/controllers.rb and port over the code to your app. You'll just need to change the app name to your app
4. Add your specs to spec/javascripts
5. Run `bundle exec guard-jasmine -u http://localhost:#{port}/jasmine` to see the results of your specs
