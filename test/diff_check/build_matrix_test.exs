defmodule DiffCheck.BuildMatrixTest do
  use ExUnit.Case, async: true

  alias DiffCheck.BuildMatrix

  test "builds a 2D hash map" do
    list1 = ["A", "B", "C", "B", "D", "A", "B"]
    list2 = ["B", "D", "C", "A", "B"]

    expected_result = %{
      {0, 0} => 0,
      {0, 1} => 0,
      {0, 2} => 0,
      {0, 3} => 1,
      {0, 4} => 1,
      {1, 0} => 1,
      {1, 1} => 1,
      {1, 2} => 1,
      {1, 3} => 1,
      {1, 4} => 2,
      {2, 0} => 1,
      {2, 1} => 1,
      {2, 2} => 2,
      {2, 3} => 2,
      {2, 4} => 2,
      {3, 0} => 1,
      {3, 1} => 1,
      {3, 2} => 2,
      {3, 3} => 2,
      {3, 4} => 3,
      {4, 0} => 1,
      {4, 1} => 2,
      {4, 2} => 2,
      {4, 3} => 2,
      {4, 4} => 3,
      {5, 0} => 1,
      {5, 1} => 2,
      {5, 2} => 2,
      {5, 3} => 3,
      {5, 4} => 3,
      {6, 0} => 1,
      {6, 1} => 2,
      {6, 2} => 2,
      {6, 3} => 3,
      {6, 4} => 4
    }

    assert BuildMatrix.call(list1, list2) == expected_result
  end
end
