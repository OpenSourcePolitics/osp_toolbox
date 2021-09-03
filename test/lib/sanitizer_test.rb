require "test_helper"

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

    assert Sanitizer.filename(filename) === "#{DateTime.now.to_i}"
  end
end
