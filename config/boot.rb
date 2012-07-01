require 'rubygems'

# Workaround for "psych.rb:148:in `parse': couldn't parse YAML at line 358 column 13 (Psych::SyntaxError)" problem
require 'yaml'
YAML::ENGINE.yamler = 'syck'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
