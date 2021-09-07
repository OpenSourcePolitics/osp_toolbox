require "test_helper"
require "minitest/mock"

class SanitizerTest < ActiveSupport::TestCase
  test "filename with valid filename" do
    filename = "Hello world"

    assert Sanitizer.filename(filename) === "hello_world"
  end

  test "filename with special characters" do
    filename = "          Ça semble marcher, a-t-il marché ?              "

    assert Sanitizer.filename(filename) === "ca_semble_marcher_a_t_il_marche"
  end

  test "filename with empty filename" do
    filename = ""

    DateTime.stub :now, DateTime.new(2022, 12, 12, 1, 1, 1).to_i do
      assert Sanitizer.filename(filename) === "1670806861"
    end
  end
end
