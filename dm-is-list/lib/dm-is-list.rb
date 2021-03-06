
require 'rubygems'
require 'pathname'

gem 'dm-core', '=0.9.6'
require 'dm-core'

gem 'dm-adjust', '=0.9.6'
require 'dm-adjust'

require Pathname(__FILE__).dirname.expand_path / 'dm-is-list' / 'is' / 'list.rb'

DataMapper::Model.append_extensions DataMapper::Is::List
