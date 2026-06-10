Code.require_file("expenseStorage.exs")
Code.require_file("expenseCalculator.exs")

defmodule ExpenseApp do
  def start do
    display_menu()
  end

  defp display_menu do
    IO.puts("\n=== Expense Manager ===")
    IO.puts("1. Add expense")
    IO.puts("2. View total expenses")
    IO.puts("3. View total expenses by category")
    IO.puts("4. View all expenses")
    IO.puts("5. Exit")
    IO.write("Choose an option (1-5): ")

    choice = IO.gets("") |> String.trim()

    case choice do
      "1" -> add_expense_prompt()
      "2" -> show_total()
      "3" -> show_total_by_title()
      "4" -> show_all_expenses()
      "5" -> IO.puts("Goodbye!")
      _ ->
        IO.puts("Invalid option. Please try again.")
        display_menu()
    end
  end

  defp add_expense_prompt do
    IO.write("Enter category/title: ")
    title = IO.gets("") |> String.trim()

    IO.write("Enter amount: ")
    amount = IO.gets("") |> String.trim()

    case ExpenseStorage.save_expense(amount, title) do
      :ok ->
        IO.puts("Expense saved successfully!")
        display_menu()
      {:error, msg} ->
        IO.puts("Error: #{msg}")
        display_menu()
    end
  end

  defp show_total do
    expenses = ExpenseStorage.load_expenses()
    total = ExpenseCalculator.calculate_total(expenses)
    IO.puts("\nTotal expenses: $#{total}")
    display_menu()
  end

  defp show_total_by_title do
    IO.write("Enter category/title to filter: ")
    title = IO.gets("") |> String.trim()

    expenses = ExpenseStorage.load_expenses()
    total = ExpenseCalculator.calculate_title_total(expenses, title)
    IO.puts("\nTotal for '#{title}': $#{total}")
    display_menu()
  end

  defp show_all_expenses do
    expenses = ExpenseStorage.load_expenses()
    IO.puts("\n=== All Expenses ===")

    if Enum.empty?(expenses) do
      IO.puts("No expenses recorded.")
    else
      Enum.each(expenses, fn expense -> IO.puts(expense) end)
    end

    display_menu()
  end
end

ExpenseApp.start()
