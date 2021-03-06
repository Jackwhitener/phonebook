require "minitest/autorun"
require_relative "bcrypt.rb"
class My_test < Minitest::Test
    def test_1
        assert_equal(1,1)
    end
    def test_bcrypt
        pass = "pass"
        assert_equal(true, checkpass(pass))
    end
    def test_bcrypt_wrong
        pass = "thisiswrong"
        assert_equal(false, checkpass(pass))
    end
    def test_for_hashpass
        pass = "pass"
        assert_equal((BCrypt::Password.create(pass) == pass), (hashpass(pass) == pass))
    end
    def test_for_passcheck
        pass = "pass"
        hash = hashpass(pass)
        assert_equal(true, passcheck(pass,hash))
    end
    def test_for_invalidclass
        pass = 21
        assert_equal(BCrypt::Password.create("21") == "21", (hashpass(pass) == pass))
    end
end