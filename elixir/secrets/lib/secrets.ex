defmodule Secrets do
  @moduledoc """
  This module contains functions that perform operations on numbers with a secret number.
  """

  @doc """
  Adds a secret number to the input number
  """
  @spec secret_add(integer()) :: (integer() -> integer())
  def secret_add(secret) do
    &(&1 + secret)
  end

  @doc """
  Subtracts a secret number from the input number
  """
  @spec secret_subtract(integer()) :: (integer() -> integer())
  def secret_subtract(secret) do
    &(&1 - secret)
  end

  @doc """
  Multiplies the input number by a secret number
  """
  @spec secret_multiply(integer()) :: (integer() -> integer())
  def secret_multiply(secret) do
    &(&1 * secret)
  end

  @doc """
  Divides the input number by a secret number
  """
  @spec secret_divide(integer()) :: (integer() -> integer())
  def secret_divide(secret) do
    &trunc(&1 / secret)
  end

  @doc """
  Performs a bitwise AND operation with a secret number
  """
  @spec secret_and(integer()) :: (integer() -> integer())
  def secret_and(secret) do
    &Bitwise.band(&1, secret)
  end

  @doc """
  Performs a bitwise OR operation with a secret number
  """
  @spec secret_xor(integer()) :: (integer() -> integer())
  def secret_xor(secret) do
    &Bitwise.bxor(&1, secret)
  end

  @spec secret_combine((integer() -> integer()), (integer() -> integer())) :: (integer() -> integer())
  def secret_combine(secret_function1, secret_function2) do
    fn x -> secret_function2.(secret_function1.(x)) end
  end
end
