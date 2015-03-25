require "lib/application_helper"
helpers ApplicationHelper

activate :deploy do |deploy|
  deploy.method = :git
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html

  activate :asset_hash
  activate :gzip
end
