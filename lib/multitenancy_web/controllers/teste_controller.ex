defmodule MultitenancyWeb.TesteController do
  use MultitenancyWeb, :controller

  def show(conn, _params) do
    subdomain = Map.get(conn.private, :subdomain, "multitenancy")
    message = "#{subdomain} funcionando!"
    json(conn, %{message: message})
  end
end
