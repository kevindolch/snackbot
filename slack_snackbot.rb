require 'slack-ruby-bot'
require 'require_all'
require 'active_record'
require_all 'slack-snackbot/commands'
require 'slack-snackbot/bot'
require_all 'models'
require 'yaml'

db_config = YAML::load(File.open('db/config.yml'))['development']
ActiveRecord::Base.establish_connection(db_config)
