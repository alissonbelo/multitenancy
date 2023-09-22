defmodule Multitenancy.Products do
  import Ecto.Query, warn: false
  alias Multitenancy.Repo
  alias Multitenancy.Products.Product

  def list_products(tenant) do
    Repo.all(Product, prefix: Triplex.to_prefix(tenant))
  end

  def create_product(tenant, attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert(prefix: Triplex.to_prefix(tenant))
  end
end
