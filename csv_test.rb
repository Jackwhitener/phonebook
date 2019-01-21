require "minitest/autorun"
require_relative "csv.rb"
class My_test < Minitest::Test
    def test1
		assert_equal(1,1)
    end
    def test_csv
      page = readfrompage([])
        assert_equal(true, page.include?(["test", " test", " test", " test", " test"]))
    end
    def test_csv_write
      write = ["test1", " test", " test", " test", " test"]
      writetopage(write)
      page = readfrompage([])
        assert_equal(true, page.include?(["test1", " test", " test", " test", " test"]))
    end
    def test_csv_delete
      
    end
end