defmodule DiffCheckTest do
  use ExUnit.Case, async: true

  test "works with valid arguments" do
    file1 = Path.expand("support/fixtures/test_response_1.json", __DIR__)
    file2 = Path.expand("support/fixtures/test_response_2.json", __DIR__)

    assert DiffCheck.main([file1, file2], true) == :ok
  end

  test "fails with non-existent files" do
    assert DiffCheck.main(["foo", "bar"], true) == {:error, "One or both files do not exist"}
  end

  test "fails with incomplete arguments" do
    assert DiffCheck.main([], true) == {:error, "You must provide exactly two arguments"}
  end
end
