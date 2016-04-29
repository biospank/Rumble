defmodule Rumble.Repo do
  #use Ecto.Repo, otp_app: :rumble

  @moduledoc """
    In memory repository
  """

  def all(Rumble.User) do
    [
      %Rumble.User{id: "1", name: "Josè", username: "josevalim", password: "elixir"},
      %Rumble.User{id: "2", name: "Bruce", username: "redrapids", password: "7langs"},
      %Rumble.User{id: "3", name: "Chris", username: "chrismccord", password: "phx"}
    ]
  end
  def all(_module), do: []

  def get(module, id) do
    all(module) |> Enum.find(fn map -> map.id == id end)
  end

  def get_by(module, params) do
    Enum.find(all(module), fn(user) ->
      Enum.all?(params, fn({key, value}) ->
        Map.fetch(user, key) == {:ok, value}
      end)
    end)
  end
end
