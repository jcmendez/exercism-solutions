defmodule Lasagna do
  @doc ~S"""
  Returns the number of expected minutes in oven.

  ## Examples

      iex> Lasagna.expected_minutes_in_oven()
      40

  """
  def expected_minutes_in_oven do
    40
  end

  @doc ~S"""
  Returns the remaining oven time in minutes.

  ## Examples

      iex> Lasagna.remaining_minutes_in_oven(30)
      10

  """
  def remaining_minutes_in_oven(current_time) do
    expected_minutes_in_oven() - current_time
  end

  @doc ~S"""
  Returns the preparation time in minutes.

  ## Examples

      iex> Lasagna.preparation_time_in_minutes(2)
      4

  """
  def preparation_time_in_minutes(num_layers) do
    2*num_layers
  end

  @doc ~S"""
  Returns the total working time in minutes.

  ## Examples

      iex> Lasagna.total_time_in_minutes(3, 20)
      26

  """
  def total_time_in_minutes(num_layers, time_in_oven) do
    preparation_time_in_minutes(num_layers) + time_in_oven
  end

  @doc ~S"""
  Returns a notification that the lasagna is ready.

  ## Examples

      iex> Lasagna.alarm()
      "Ding!"

  """
  def alarm do
    "Ding!"
  end
end
