defmodule Multitenancy.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Multitenancy.Repo

  alias Multitenancy.Accounts.Account

  def get_account!(name), do: Repo.get!(Account, name: name)

  def create_account(attrs \\ %{}) do
    %Account{}
    |> Account.changeset(attrs)
    |> Repo.insert()
  end
end
