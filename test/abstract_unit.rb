$:.unshift(File.dirname(__FILE__) + '/../lib')
$:.unshift(File.dirname(__FILE__) + '/../../../rails/activesupport/lib')
$:.unshift(File.dirname(__FILE__) + '/../../../rails/activerecord/lib')

require 'test/unit'
require 'active_support'
require 'active_record'
require 'active_record/fixtures'
require 'technoweenie/active_record_context'

config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")
ActiveRecord::Base.establish_connection(config[ENV['DB'] || 'sqlite'])

load(File.dirname(__FILE__) + "/schema.rb")

ActiveRecord::Base.send :extend, Technoweenie::ActiveRecordContext

class Foo < ActiveRecord::Base
  set_table_name 'foo'
end