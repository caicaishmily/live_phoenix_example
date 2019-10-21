defmodule LivePhoenixExample.Schema.Girl do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query

  schema "girls" do
    field(:name, :string)
    field(:avatar, :string)
    field(:age, :integer)
    field(:like, :integer)
    field(:dislike, :integer)

    timestamps(type: :utc_datetime)
  end

end
