defmodule MultitenancyWeb.ProductsController do
  use MultitenancyWeb, :controller

  alias Multitenancy.Products

  def index(conn, _params) do
    tenant = Map.get(conn.private, :subdomain, "multitenancy")
    products = Products.list_products(tenant)

    conn
    |> render(:index, %{products: products, tenant: tenant})
  end
end
