defmodule Exlibfunc.Live.FlightLogs do
  def search_by_airport(airport) do
    list_flights()
    |> Enum.filter(&(&1.origin == airport || &1.destination == airport))
  end

  def list_flights do
    [%{
      number: "450",
      origin: "DEN",
      destination: "ORD",
      departure_time: "11:13",
      arrival_time: "11:14"
    },
    %{
      number: "450",
      origin: "DEN",
      destination: "ORD",
      departure_time: "11:13",
      arrival_time: "11:14"
    },
    %{
      number: "450",
      origin: "DAN",
      destination: "ORD",
      departure_time: "11:13",
      arrival_time: "11:14"
    },
    %{
      number: "450",
      origin: "Air",
      destination: "ORD",
      departure_time: "11:13",
      arrival_time: "11:14"
    },
    %{
      number: "450",
      origin: "DAN",
      destination: "ORD",
      departure_time: "11:13",
      arrival_time: "11:14"
    }
  ]
  end
end
