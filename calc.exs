defmodule Calc do
Code.require_file("fileContent.exa")

def calculate_average do
    case FileContent.read_file() do
      {:ok, {content, process_count}} -> {content, process_count}

      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
    end
  end
end
