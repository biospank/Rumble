defmodule Rumble.SessionController do
  use Rumble.Web, :controller
  import Rumble.Auth, only: [login_by_username_and_pass: 4]

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => username, "password" => password}}) do
    case Rumble.Auth.login_by_username_and_pass(conn, username, password, repo: Rumble.Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Username or password incorrect")
        |> render("new.html")
    end
  end
end
