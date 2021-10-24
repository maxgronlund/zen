defmodule SplitterTest do
  use ExUnit.Case
  doctest Splitter

  test "find_flow" do
    flows = [
      %Flow{name: "A", weight: 10},
      %Flow{name: "B", weight: 5},
      %Flow{name: "C", weight: 10}
    ]

    assert Splitter.find_flow(-10, flows) == {:ok, "A"}
    assert Splitter.find_flow(5, flows) == {:ok, "A"}
    assert Splitter.find_flow(10, flows) == {:ok, "B"}
    assert Splitter.find_flow(15, flows) == {:ok, "C"}
    assert Splitter.find_flow(35, flows) == {:error, "random to high"}
  end
end
