require "minitest/autorun"
require_relative 'uniqueuserid.rb'
class My_test < Minitest::Test
    def test_1
        assert_equal(1,1)
    end
    def test_for_class
        userid = uuid()
        assert_equal(Integer, userid.class)
    end
end