defmodule ExpenseCalculator do
  def calculate_total(expenses) do
    expenses
    |> Enum.map(&extract_amount/1)
    |> Enum.sum()
  end

  defp extract_amount(expense) do
    expense
    |> String.split("] ")
    |> List.last()
    |> String.trim()
    |> Float.parse()
    |> elem(0)
  end
  def calculate_title_total(expenses, title) do
    expenses
    |> Enum.filter(&String.starts_with?(&1, "[#{title}]"))
    |> Enum.map(&String.replace_prefix(&1, "[#{title}] ", ""))
    |> Enum.map(&String.trim/1)
    |> Enum.map(&Float.parse/1)
    |> Enum.map(&elem(&1, 0))
    |> Enum.sum()
  end
end
