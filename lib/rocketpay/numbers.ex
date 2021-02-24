defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file_content()
  end

  defp handle_file_content({:ok, file_content}) do
    result =
      file_content
      |> String.split(",")
      |> Stream.map(fn number -> String.to_integer(number) end)
      |> Enum.sum()

    {:ok, %{result: result}}
  end

  defp handle_file_content({:error, _reason}), do: {:error, %{message: "Invalid file!"}}
end
