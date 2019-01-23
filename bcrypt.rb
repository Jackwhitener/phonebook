require 'bcrypt'
def checkpass(pass)
    my_password = BCrypt::Password.create('pass')
    puts my_password
    puts pass
    puts my_password == pass
    return my_password == pass
end
def hashpass(pass)
    return BCrypt::Password.create(pass)
end