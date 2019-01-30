require 'mysql2'
require_relative 'uniqueuserid.rb'
require_relative 'bcrypt.rb'
load "./local_ENV.rb" if File.exist?('./local_ENV.rb')
def client
    Mysql2::Client.new(
      :host => ENV['host'],
      :username => ENV['username'],
      :password => ENV['password'],
      :database => ENV['database'],
      :port => ENV['port']
)
end
def check_if_taken(username)
    check = client.query(
        "SELECT username FROM users WHERE users.username = '#{username}'"
        )
        return check.count > 0
end
def add_user(username, password)
    password = hashpass(password)
    if !check_if_taken(username)
        client.query(
          "INSERT INTO users (userid, username, password)
          VALUES (UUID(), '#{username}', '#{password}')"
        )
    end
end
add_user('admin', 'password')