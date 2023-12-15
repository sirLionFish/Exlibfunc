defmodule Exlibfunc.Live.Airports do
  def suggust(""), do: []

  def sugguest(prefix) do
    Map.filter(list_airports(), fn {code, _} ->
      String.starts_with?(code, String.upcase(prefix))
    end)
  end

  def list_airports do
    %{
      "DEN" => "Denver Aiport I guess?",
      "DAN" => "Maybe Danver? I don't know my airports"
    }
  end
end
