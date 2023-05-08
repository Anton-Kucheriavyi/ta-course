# frozen_string_literal: true

require 'ffaker'

# This class describes User model
class User
  attr_reader :username, :password, :firstname, :lastname, :email

  def initialize
    @firstname = FFaker::Name.first_name
    @lastname = FFaker::Name.last_name
    @username = @firstname + @lastname
    @password = FFaker::Internet.password
    @email = FFaker::Internet.safe_email
  end
end
