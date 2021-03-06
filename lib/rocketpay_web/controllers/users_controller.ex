defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.User

  action_fallback RocketpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Rocketpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
    # params
    # |> Rocketpay.create_user()
    # |> handle_response(conn)
  end

  # defp handle_response({:ok, %User{} = user}, conn) do
  #   conn
  #   |> put_status(:created)
  #   |> render("create.json", user: user)
  # end

  # defp handle_response({:error, reason}, conn) do
  #   conn
  #   |> put_status(:bad_request)
  #   # |> json(reason)
  #   |> put_view(RocketpayWeb.ErrorView)
  #   |> render("400.json", result: reason)
  # end

  # defp handle_response({:error, _reason} = error, _conn), do: error
end
