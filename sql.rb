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
def get_pass(username)
    password = client.query(
      "SELECT password FROM users WHERE users.username = '#{username}'"
    )
    password.each do |pass|
      return pass["password"].to_s
    end
end
def user_id(username)
    id = client.query(
      "SELECT userid FROM users WHERE users.username = '#{username}'"
    )
    id.each do |i|
      return i["userid"].to_s
    end
  end
