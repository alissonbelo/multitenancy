defmodule Multitenancy.Repo.Migrations.CreateProductsTable do
  use Ecto.Migration

  def change do
    create table("products") do
      add :name, :string

      timestamps()
    end
  end
end
