defmodule Splitter do
  @moduledoc """
  Documentation for `Splitter`.
  Takes a list of %Flows{}, and a number for selectioin of a flow.
  Flows are waigthed,
  Returns the name of the selected flow
  """
  @doc """
  find_flow.

  ## Examples

      iex> Splitter.find_flow(0, [%Flow{name: "A", weight: 1}])
      {:ok, "A"}
  """
  def find_flow(rand, flows) do
    weight_flows(flows, 0, []) |> test_flows(rand)
  end

  defp weight_flows([], _, result), do: Enum.reverse(result)

  defp weight_flows([h | t], acc, result) do
    sum = acc + h.weight
    weight_flows(t, sum, [%Flow{name: h.name, weight: sum} | result])
  end

  defp test_flows([], _), do: {:error, "random to high"}

  defp test_flows([h | t], rand) do
    cond do
      rand < h.weight ->
        {:ok, h.name}

      true ->
        test_flows(t, rand)
    end
  end
end
