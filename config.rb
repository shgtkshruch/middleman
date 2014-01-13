###
# slim
###

require 'slim'
# Set slim-lang output style
Slim::Engine.set_default_options :pretty => true, :sort_attrs => false
# Slim::Engine.disable_option_validator!
# Set template language
# set :slim, :layout_engine => :slim
# Set shortcut
# Slim::Engine.set_default_options :shortcut => {
#   '#' => {:tag => 'div', :attr => 'id'},
#   '.' => {:tag => 'div', :attr => 'class'},
#   '&' => {:tag => 'input', :attr => 'type'}
# }

# A simple and lightweight mixin library for Sass.
# http://bourbon.io/
require "bourbon"

# Adds glob-based imports to Sass
# https://github.com/chriseppstein/sass-globbing
# require "sass-globbing"

# SassyLists is a Compass Extension
# http://sassylists.com/
require "SassyLists"

# Responsive grids for Compass.
# http://susy.oddbird.net/
# require "susy"

# A lightweight semantic grid framework
# for Sass and Bourbon
# http://neat.bourbon.io/
# require "neat"

# bootstrap-sass
# Official port of Bootstrap to Sass, ready to roll.
# https://github.com/twbs/bootstrap-sass
# require "bootstrap-sass"


###
# Compass
###

# Change Compass configuration
compass_config do |config|
  # config.output_style = :compact
  # Disable line comments even in development
  config.line_comments = false
  config.sass_options = {
    :style => :expanded
  }
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
page "/*", :layout => "index"

# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

#[deprecated] I18n.enforce_available_locales will default to true in the future.
#If you really want to skip validation of your locale you can set I18n.enforce_available_locales = false to avoid this message.
I18n.enforce_available_locales = false
# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :relative_links, true

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :layout_dir, 'layouts'

set :partials_dir, 'partials'

set :data_dir, 'data'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
