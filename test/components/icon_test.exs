defmodule FontAwesome.Components.IconTest do
  use FontAwesome.ConnCase, async: true

  alias FontAwesome.Components.Icon

  defmodule ViewWithIcon do
    use Surface.LiveView

    data aria_hidden, :boolean, default: false

    def handle_event("toggle_aria_hidden", _, socket) do
      {:noreply, assign(socket, :aria_hidden, !socket.assigns.aria_hidden)}
    end

    def render(assigns) do
      ~H"""
      <Icon type="regular" name="address-book" opts={{ aria_hidden: @aria_hidden }} />
      """
    end
  end

  test "renders icon" do
    html =
      render_surface do
        ~H"""
        <Icon type="regular" name="address-book" />
        """
      end

    assert html =~ "<svg"
  end

  test "renders icon with class" do
    html =
      render_surface do
        ~H"""
        <Icon type="regular" name="address-book" class="h-4 w-4" />
        """
      end

    assert html =~ ~s(<svg class="h-4 w-4")
  end

  test "renders icon with opts" do
    html =
      render_surface do
        ~H"""
        <Icon type="regular" name="address-book" opts={{ aria_hidden: true }} />
        """
      end

    assert html =~ ~s(<svg aria-hidden="true")
  end

  test "class prop overrides opts prop" do
    html =
      render_surface do
        ~H"""
        <Icon type="regular" name="address-book" class="hello" opts={{ class: "world" }} />
        """
      end

    assert html =~ ~s(<svg class="hello")
  end

  test "raises if type or icon don't exist" do
    msg = ~s(icon of type "hello" with name "address-book" does not exist.)

    assert_raise ArgumentError, msg, fn ->
      render_surface do
        ~H"""
        <Icon type="hello" name="address-book" />
        """
      end
    end

    msg = ~s(icon of type "regular" with name "world" does not exist.)

    assert_raise ArgumentError, msg, fn ->
      render_surface do
        ~H"""
        <Icon type="regular" name="world" />
        """
      end
    end
  end

  test "updates when opts change", %{conn: conn} do
    {:ok, view, html} = live_isolated(conn, ViewWithIcon)

    assert html =~ ~s(<svg aria-hidden="false")

    assert render_click(view, :toggle_aria_hidden) =~
             ~s(<svg aria-hidden="true")

    assert render_click(view, :toggle_aria_hidden) =~
             ~s(<svg aria-hidden="false")
  end
end
