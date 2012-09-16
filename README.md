# @markup markdown

# HasDuration

Do you use rails time convenience methods? Those things are great, they let you do stuff like `1.day.from_now` or `Time.now - 10.years`. The `10.years` part is an {ActiveSupport::Duration} object.

This plugin extends ActiveRecord so you can conveniently store durations like: how often to contact a given customer, or how long can your users stay in the bathtub without their fingertips wrinkling.


## Installation: Add this to your Gemfile

    gem 'has_duration'

## Given a table defined as:

    create_table :user do |t|
      t.string :contact_every, null: false
      t.string :bathtub_tolerance
    end

## You can have a model like this

    class User < ActiveRecord::Base
      has_duration :contact_every
      # Has duration does not validate presence, you have to do that yourself.
      validates :contact_every, presence: true
      has_duration :bathtub_tolerance
    end

    user = User.create!(contact_every: 1.year, bathtub_tolerance: 30.minutes)
    puts 'that must be a record' if customer.bathtub_tolerance > 3.hours
    puts "If contacted today, next contact would be made on #{user.contact_every.from_now}"

This project uses MIT-LICENSE.
