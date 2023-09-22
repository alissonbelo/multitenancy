defmodule MultitenancyWeb.ProductsJSON do
  alias Multitenancy.Products.Product

  def index(%{products: products, tenant: tenant}) do
    IO.inspect(products)
    %{
      data: Enum.map(products, &data/1),
      tenant: tenant
    }
  end

  defp data(%Product{} = product) do
    %{
      name: product.name
    }
  end
end
