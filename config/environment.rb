# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Eddy2::Application.initialize!

#Mime
Mime::Type.register 'application/metafile4+xml', :meta4

