require "minitest/autorun"
require_relative "sql.rb"
class My_test < Minitest::Test
    def test_1
        assert_equal(1,1)
    end
    def test_check_if_taken
        assert_equal(true, check_if_taken('admin'))
    end
    
end