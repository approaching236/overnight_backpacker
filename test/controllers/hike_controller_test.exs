defmodule OvernightBackpacker.HikeControllerTest do
  use OvernightBackpacker.ConnCase

  alias OvernightBackpacker.Hike
  @valid_attrs %{description: "some content", directions: "some content", distance: "120.5", elevation_gain: "120.5", elevation_loss: "120.5", name: "some content", trailhead_lat: "120.5", trailhead_long: "120.5"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, hike_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing hikes"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, hike_path(conn, :new)
    assert html_response(conn, 200) =~ "New hike"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, hike_path(conn, :create), hike: @valid_attrs
    assert redirected_to(conn) == hike_path(conn, :index)
    assert Repo.get_by(Hike, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, hike_path(conn, :create), hike: @invalid_attrs
    assert html_response(conn, 200) =~ "New hike"
  end

  test "shows chosen resource", %{conn: conn} do
    hike = Repo.insert! %Hike{}
    conn = get conn, hike_path(conn, :show, hike)
    assert html_response(conn, 200) =~ "Show hike"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, hike_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    hike = Repo.insert! %Hike{}
    conn = get conn, hike_path(conn, :edit, hike)
    assert html_response(conn, 200) =~ "Edit hike"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    hike = Repo.insert! %Hike{}
    conn = put conn, hike_path(conn, :update, hike), hike: @valid_attrs
    assert redirected_to(conn) == hike_path(conn, :show, hike)
    assert Repo.get_by(Hike, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    hike = Repo.insert! %Hike{}
    conn = put conn, hike_path(conn, :update, hike), hike: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit hike"
  end

  test "deletes chosen resource", %{conn: conn} do
    hike = Repo.insert! %Hike{}
    conn = delete conn, hike_path(conn, :delete, hike)
    assert redirected_to(conn) == hike_path(conn, :index)
    refute Repo.get(Hike, hike.id)
  end
end
