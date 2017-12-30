defmodule Gind.Venues do
  @moduledoc """
  The Venues context.
  """

  import Ecto.Query, warn: false
  alias Gind.Repo

  alias Gind.Venues.Bar

  @doc """
  Returns the list of bars.

  ## Examples

      iex> list_bars()
      [%Bar{}, ...]

  """
  def list_bars do
    Repo.all(Bar)
  end

  @doc """
  Gets a single bar.

  Raises `Ecto.NoResultsError` if the Bar does not exist.

  ## Examples

      iex> get_bar!(123)
      %Bar{}

      iex> get_bar!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bar!(id), do: Repo.get!(Bar, id)

  @doc """
  Creates a bar.

  ## Examples

      iex> create_bar(%{field: value})
      {:ok, %Bar{}}

      iex> create_bar(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bar(attrs \\ %{}) do
    %Bar{}
    |> Bar.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bar.

  ## Examples

      iex> update_bar(bar, %{field: new_value})
      {:ok, %Bar{}}

      iex> update_bar(bar, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bar(%Bar{} = bar, attrs) do
    bar
    |> Bar.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Bar.

  ## Examples

      iex> delete_bar(bar)
      {:ok, %Bar{}}

      iex> delete_bar(bar)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bar(%Bar{} = bar) do
    Repo.delete(bar)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bar changes.

  ## Examples

      iex> change_bar(bar)
      %Ecto.Changeset{source: %Bar{}}

  """
  def change_bar(%Bar{} = bar) do
    Bar.changeset(bar, %{})
  end
end
