require 'active_record'
require_relative '../lib/has_duration'
require 'rspec/autorun'
require 'logger'

ActiveRecord::Base.configurations = {'sqlite3' => {:adapter => 'sqlite3', :database => ':memory:'}}
ActiveRecord::Base.establish_connection('sqlite3')

ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.logger.level = Logger::WARN

ActiveRecord::Schema.define(:version => 0) do
  create_table :visits do |t|
    t.string :doctor
    t.string :club
  end
end

class Visit < ActiveRecord::Base
  has_duration :doctor
  validates :doctor, presence: true
  has_duration :club
end
