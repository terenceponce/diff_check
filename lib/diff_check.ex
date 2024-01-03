defmodule DiffCheck do
  alias DiffCheck.BuildMatrix
  alias DiffCheck.PrintDiff

  def main(args, disable_printing \\ false) do
    case validate_args(args) do
      :ok ->
        [file1_path, file2_path] = args

        file1 = File.read!(file1_path) |> String.split("\n")
        file2 = File.read!(file2_path) |> String.split("\n")

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
end
