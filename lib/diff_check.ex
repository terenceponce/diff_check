defmodule DiffCheck do
  @moduledoc """
  DiffCheck is a command-line tool that compares two files and prints the
  differences between them.

  The way this works is that it builds a 2D matrix of the two files by
  computing for the longest subsequence between each files. It then prints
  the differences between the two files by backtracking through the matrix.

  The LCS implementation used is based on this Wikipedia article:

  https://en.wikipedia.org/wiki/Longest_common_subsequence
  """

  alias DiffCheck.BuildMatrix
  alias DiffCheck.PrintDiff

  @spec main(args :: [String.t()], disable_printing :: boolean) :: :ok | {:error, String.t()}
  def main(args, disable_printing \\ false) do
    case validate_args(args) do
      :ok ->
        [file1_path, file2_path] = args

        file1 = stringify_file(file1_path)
        file2 = stringify_file(file2_path)

        file1
        |> BuildMatrix.call(file2)
        |> PrintDiff.call(file1, file2)
        |> Enum.join("\n")
        |> print_to_io(disable_printing)

      {:error, message} ->
        print_to_io("Error: #{message}", disable_printing)
        {:error, message}
    end
  end

  defp validate_args(args) do
    case args do
      [file1, file2] ->
        if File.exists?(file1) and File.exists?(file2) do
          :ok
        else
          {:error, "One or both files do not exist"}
        end

      _ ->
        {:error, "You must provide exactly two arguments"}
    end
  end

  defp print_to_io(message, disable_printing) do
    # coveralls-ignore-start
    unless disable_printing do
      IO.write(message)
    end

    # coveralls-ignore-stop

    :ok
  end

  defp stringify_file(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
  end
end
