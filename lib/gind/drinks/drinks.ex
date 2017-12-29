defmodule Gind.Drinks do
  @moduledoc """
  The Drinks context.
  """

  import Ecto.Query, warn: false
  alias Gind.Repo

  alias Gind.Drinks.Gin

  @doc """
  Returns the list of gins.

  ## Examples

      iex> list_gins()
      [%Gin{}, ...]

  """
  def list_gins do
    Repo.all(Gin)
  end

  @doc """
  Gets a single gin.

  Raises `Ecto.NoResultsError` if the Gin does not exist.

  ## Examples

      iex> get_gin!(123)
      %Gin{}

      iex> get_gin!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gin!(id), do: Repo.get!(Gin, id)

  @doc """
  Creates a gin.

  ## Examples

      iex> create_gin(%{field: value})
      {:ok, %Gin{}}

      iex> create_gin(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gin(attrs \\ %{}) do
    %Gin{}
    |> Gin.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a gin.

  ## Examples

      iex> update_gin(gin, %{field: new_value})
      {:ok, %Gin{}}

      iex> update_gin(gin, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gin(%Gin{} = gin, attrs) do
    gin
    |> Gin.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Gin.

  ## Examples

      iex> delete_gin(gin)
      {:ok, %Gin{}}

      iex> delete_gin(gin)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gin(%Gin{} = gin) do
    Repo.delete(gin)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gin changes.

  ## Examples

      iex> change_gin(gin)
      %Ecto.Changeset{source: %Gin{}}

  """
  def change_gin(%Gin{} = gin) do
    Gin.changeset(gin, %{})
  end
end
