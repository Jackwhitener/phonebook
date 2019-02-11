require 'bcrypt'
def checkpass(pass)
    my_password = BCrypt::Password.create('pass')
    puts my_password.length
    puts pass
    puts my_password == pass
    return my_password == pass
end
def hashpass(pass)
    return BCrypt::Password.create(pass)
end
def passcheck(pass,hashpass)
    puts hashpass
    return BCrypt::Password.new(hashpass) == pass
end
checkpass("apples")