defmodule LiveSketch.DrawLogicTest do
  use ExUnit.Case
  doctest LiveSketch.DrawLogic

  test "validate_session" do
    assert LiveSketch.DrawLogic.validate_session("valid") == :ok
    assert LiveSketch.DrawLogic.validate_session("") == :error
  end

  test "process_draw" do
    data = %{points: [1,2,3]}
    result = LiveSketch.DrawLogic.process_draw("sess1", data)
    assert Map.has_key?(result, :timestamp)
    assert result.session == "sess1"
  end
end