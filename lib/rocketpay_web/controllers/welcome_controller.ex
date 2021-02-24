defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  def index(conn, _params) do
    # text(conn, "Welcome to the Rocketpay API!")
    json(conn, %{"message": "Welcome to the Rocketpay API!"})
  end
end
