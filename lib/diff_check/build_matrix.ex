defmodule DiffCheck.BuildMatrix do
  @moduledoc """
  This module builds a 2D matrix by computing for the longest common
  subsequence of two lists (x and y).
  """

  @spec call(list1 :: [String.t()], list2 :: [String.t()]) :: map()
  def call(list1, list2) do
    list1 = Enum.with_index(list1)
    list2 = Enum.with_index(list2)

    Enum.reduce(list1, %{}, fn {x, i}, acc ->
      iterate_inner_list(x, i, list2, acc)
    end)
  end

  defp iterate_inner_list(x, i, list2, acc) do
    Enum.reduce(list2, acc, fn {y, j}, acc2 ->
      if x == y do
        Map.put(acc2, {i, j}, Map.get(acc2, {i - 1, j - 1}, 0) + 1)
      else
        Map.put(acc2, {i, j}, max(Map.get(acc2, {i, j - 1}, 0), Map.get(acc2, {i - 1, j}, 0)))
      end
    end)
  end
end
