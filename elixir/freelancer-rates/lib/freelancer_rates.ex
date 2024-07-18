defmodule FreelancerRates do
  @doc """
  Calculate the daily rate based on the hourly rate.
  Per the specification, the daily rate is 8 times the hourly rate,
  and this function must return a float.
  """
  @spec daily_rate(number()) :: float()
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  @doc """
  Calculate the discounted rate.  The discount is a percentage, expressed as
  a number between 0 and 100.  The discounted rate is the base rate minus the
  discount.
  """
  @spec apply_discount(number(), number()) :: float()
  def apply_discount(before_discount, discount) do
    before_discount * (1.0 - discount / 100.0)
  end

  @doc """
  Calculate the monthly rate based on the hourly rate and discount.
  The monthly rate is 22 times the daily rate, and this function must return a float.
  """
  @spec monthly_rate(number(), number()) :: integer()
  def monthly_rate(hourly_rate, discount) do
    ceil(22.0 * apply_discount(daily_rate(hourly_rate), discount))
  end

  @doc """
  Calculate the number of days in the budget based on the budget, hourly rate, and discount.
  The number of days in the budget is the budget divided by the discounted daily rate, rounded
  down to one decimal place. This function must return a float.
  """
  @spec days_in_budget(number(), number(), number()) :: float()
  def days_in_budget(budget, hourly_rate, discount) do
    floor(10.0 * budget / apply_discount(daily_rate(hourly_rate), discount))/10.0
  end
end
