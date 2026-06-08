defmodule ExpenseStorage do
  def save_expense(expense , title) do
    # add expense to file
    if File.write("expenses.txt", "[#{title}] #{expense}\n", [:append]) do
      :ok
    else
      {:error, "Failed to save expense"}
    end
  end
  def load_expenses() do
    case File.read("expenses.txt") do
      {:ok, content} -> String.split(content, "\n", trim: true)
      {:error, _} -> ["failed to load expenses"]
    end
  end
end
