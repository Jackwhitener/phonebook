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
    def test_for_add_false
        assert_equal(false,add_user('admin', 'apples123'))
    end
    def test_for_add_account
        username = Random.new
        assert_equal(true, add_user(username.rand(1000000), "password"))
    end
end