defmodule FileContent do
  def read_file do
    case File.read("content.txt") do
      {:ok, content} ->
process_count =
        content
          |> String.split("\r\n", trim: true)
          |> Enum.count()
          |> Kernel./(2)
          |> Float.ceil()
          |> trunc()
          IO.puts(process_count)
          {:ok, {content, process_count}}
      {:error, reason} -> {:error, reason}
    end
  end
end

FileContent.read_file()
