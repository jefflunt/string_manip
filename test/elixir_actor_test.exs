defmodule StringManipTest do
  use ExUnit.Case
  doctest StringManip

  test "uppercase" do
    assert StringManip.upcase("foo") == "FOO"
  end

  test "middle" do
    assert StringManip.middle("abc") == "b"
    assert StringManip.middle("") == ""
    assert StringManip.middle("ab") == ""
  end

  test "l_half" do
    assert StringManip.l_half("abc") == "a"
    assert StringManip.l_half("abcd") == "ab"
    assert StringManip.l_half("") == ""
  end

  test "r_half" do
    assert StringManip.r_half("abc") == "c"
    assert StringManip.r_half("abcd") == "cd"
    assert StringManip.r_half("") == ""
  end

  test "reverse" do
    assert StringManip.reverse("foo") == "oof"
  end

  test "parts" do
    assert StringManip.split("foo bar baz") == ["foo", "bar", "baz"]
  end

  test "bizarro_world" do
    assert StringManip.upcase_reverse_split("foo bar baz") == ["ZAB", "RAB", "OOF"]
  end

  test "inside_out" do
    assert StringManip.inside_out("abcde") == "baced"
    assert StringManip.inside_out("foobarbaz") == "boofazabr"
    assert StringManip.inside_out("123456") == "321654"
  end
end
