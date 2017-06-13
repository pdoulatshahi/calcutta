defmodule Calcutta.User do
  use Calcutta.Web, :model

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(email), [])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
  end

  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> unique_constraint(:email)
    |> validate_length(:password, min: 6)
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
