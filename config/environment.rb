# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Msociais::Application.initialize!

# Default encoding
Encoding.default_internal = Encoding.find("UTF-8")