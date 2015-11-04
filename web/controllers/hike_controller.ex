defmodule OvernightBackpacker.HikeController do
  use OvernightBackpacker.Web, :controller

  alias OvernightBackpacker.Hike

  plug :scrub_params, "hike" when action in [:create, :update]

  def index(conn, _params) do
    hikes = Repo.all(Hike)
    render(conn, "index.html", hikes: hikes)
  end

  def new(conn, _params) do
    changeset = Hike.changeset(%Hike{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"hike" => hike_params}) do
    changeset = Hike.changeset(%Hike{}, hike_params)

    case Repo.insert(changeset) do
      {:ok, _hike} ->
        conn
        |> put_flash(:info, "Hike created successfully.")
        |> redirect(to: hike_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    hike = Repo.get!(Hike, id)
    render(conn, "show.html", hike: hike)
  end

  def edit(conn, %{"id" => id}) do
    hike = Repo.get!(Hike, id)
    changeset = Hike.changeset(hike)
    render(conn, "edit.html", hike: hike, changeset: changeset)
  end

  def update(conn, %{"id" => id, "hike" => hike_params}) do
    hike = Repo.get!(Hike, id)
    changeset = Hike.changeset(hike, hike_params)

    case Repo.update(changeset) do
      {:ok, hike} ->
        conn
        |> put_flash(:info, "Hike updated successfully.")
        |> redirect(to: hike_path(conn, :show, hike))
      {:error, changeset} ->
        render(conn, "edit.html", hike: hike, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    hike = Repo.get!(Hike, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(hike)

    conn
    |> put_flash(:info, "Hike deleted successfully.")
    |> redirect(to: hike_path(conn, :index))
  end
end
