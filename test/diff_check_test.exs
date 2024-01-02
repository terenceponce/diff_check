defmodule DiffCheckTest do
  use ExUnit.Case
  doctest DiffCheck

  test "works with valid arguments" do
    file1 = Path.expand("support/fixtures/13.3.7_.json", __DIR__)
    file2 = Path.expand("support/fixtures/13.4.0_.json", __DIR__)

    assert DiffCheck.main([file1, file2]) == :ok
  end

  test "fails with incomplete arguments" do
    assert DiffCheck.main([]) == {:error, "You must provide exactly two arguments"}
  end
end
