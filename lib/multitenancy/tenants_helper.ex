defmodule Multitenancy.TenantsHelper do
  alias Multitenancy.Accounts
  alias Multitenancy.Repo

  def create_tenant(name) do
    Triplex.create_schema(name, Repo, fn(tenant, repo) ->
      {:ok, _} = Triplex.migrate(tenant, repo)

      Repo.transaction(fn ->
        with {:ok, account} <- Accounts.create_account(%{name: tenant}) do
          {:ok, account}
        else
          {:error, error} ->
            Repo.rollback(error)
        end
      end)
    end)
  end
end
