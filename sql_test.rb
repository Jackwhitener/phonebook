require "minitest/autorun"
require_relative "sql.rb"
class My_test < Minitest::Test
    def test_1
        assert_equal(1,1)
    end
end