defmodule Exlibfunc.Basic.Function do

  def anonfunc(list) do
    for x <- list, do: x*x
  end

  # Looping
  def loopfunc(list) do
    for x <- list, times <- 1..10 do
      IO.puts "#{x} - #{times}"
    end
  end
end
