defmodule DiffCheck.PrintDiff do
  @moduledoc """
  Takes a 2D matrix and two lists and builds a list of string containing the
  difference between the two lists by backtracking through the matrix.
  """

  @spec call(matrix :: map(), list1 :: [String.t()], list2 :: [String.t()]) ::
          [String.t()]
  def call(matrix, list1, list2) do
    backtrack([], matrix, list1, list2, length(list1) - 1, length(list2) - 1)
  end

  defp backtrack(output, matrix, list1, list2, i, j) do
    cond do
      i < 0 && j < 0 ->
        output

      i < 0 ->
        line = diff_line("+", list2, j, output)
        backtrack(line, matrix, list1, list2, i, j - 1)

      j < 0 ->
        line = diff_line("-", list1, i, output)
        backtrack(line, matrix, list1, list2, i - 1, j)

      Enum.at(list1, i) == Enum.at(list2, j) ->
        line = diff_line(" ", list1, i, output)
        backtrack(line, matrix, list1, list2, i - 1, j - 1)

      Map.get(matrix, {i, j - 1}) >= Map.get(matrix, {i - 1, j}) ->
        line = diff_line("+", list2, j, output)
        backtrack(line, matrix, list1, list2, i, j - 1)

      Map.get(matrix, {i, j - 1}) < Map.get(matrix, {i - 1, j}) ->
        line = diff_line("-", list1, i, output)
        backtrack(line, matrix, list1, list2, i - 1, j)
    end
  end

  defp diff_line(prefix, list, index, output) do
    [prefix <> " " <> Enum.at(list, index) | output]
  end
end
