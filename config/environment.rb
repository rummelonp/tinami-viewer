# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TinamiViewer::Application.initialize!

TINAMI.configure do |config|
  config.api_key = '*** api key ***'
end
