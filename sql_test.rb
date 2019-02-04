require "minitest/autorun"
require_relative "sql.rb"
class My_test < Minitest::Test
    def test_1
        assert_equal(1,1)
    end
    def test_check_if_taken
        assert_equal(true, check_if_taken('admin'))
    end
    def test_check_if_not_taken
        assert_equal(false, check_if_taken('smittywerberjaegermanjensen'))
    end
    def test_check_if_not_taken_non_string
        assert_equal(false,check_if_taken(123))
    end
end