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

end