defmodule Rules do
  @doc """
  Returns true if Pac-Man eats a ghost

  iex > Rules.eat_ghost?(false, true)
  false
  """
  def eat_ghost?(power_pellet_active, touching_ghost) do
    touching_ghost and power_pellet_active
  end

  @doc """
  Returns true if Pac-Man scores

  iex > Rules.score?(true, true)
  true
  """
  def score?(touching_power_pellet, touching_dot) do
    touching_power_pellet or touching_dot
  end

  @doc """
  Returns true if Pac-Man loses

  iex > Rules.lose?(false, true)
  true
  """
  def lose?(power_pellet_active, touching_ghost) do
    touching_ghost and not(power_pellet_active)
  end

  @doc """
  Returns true if Pac-Man wins

  iex > Rules.win?(false, true, false)
  false
  """
  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    has_eaten_all_dots and not(lose?(power_pellet_active, touching_ghost))
  end
end
