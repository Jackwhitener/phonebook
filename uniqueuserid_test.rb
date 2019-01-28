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
    def test_for_length
        userid = uuid()
        assert_equal(16, userid.to_s.length)
    end
    def test_for_randomly_generated
        userid = uuid()
        assert_equal(false, 1111111111111111 == userid )
    end
end