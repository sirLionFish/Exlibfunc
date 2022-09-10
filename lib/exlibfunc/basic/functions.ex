<<<<<<< HEAD:lib/exlibfunc/loop/functions.ex
defmodule Exlibfunc.Libraries.Loop.Function do
=======
defmodule Exlibfunc.Basic.Function do
>>>>>>> fd7e852966446b4a95b2c4ca298eca4a6d549b4f:lib/exlibfunc/basic/functions.ex

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
