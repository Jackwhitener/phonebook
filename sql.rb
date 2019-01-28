require 'mysql2'
require_relative 'uniqueuserid.rb'
require_relative 'bcrypt.rb'
load "./local_ENV.rb" if File.exist?('./local_ENV.rb')
def add_user(username, password)
    password = hashpass(password)
    userid = userid()
end