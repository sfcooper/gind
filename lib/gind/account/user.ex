defmodule Gind.Account.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gind.Account.User


  schema "users" do
    field :email, :string
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password_hash])
    |> validate_required([:email, :password_hash])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password_hash, min: 6)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
  case changeset do
    %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
      put_change(changeset, :password_hash,
                 Comeonin.Bcrypt.hashpwsalt(pass))
    _ ->
      changeset
  end
  end



end
