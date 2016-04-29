defmodule Rumble.User do
  use Rumble.Web, :model

  schema "users" do
    field :name, :string
    field :usernam, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps
  end
end
