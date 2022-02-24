defmodule MuuriWeb.PageLive do
  use MuuriWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    # {:ok, assign(socket, cards: [3, 2, 1], next_card: 4), temporary_assigns: [cards: []]}
    {:ok, assign(socket, cards: get_cards(), next_card: 4), temporary_assigns: [cards: []]}

  end

  @impl true
  def handle_event("add", _params, socket) do
    %{next_card: next_card} = socket.assigns
    new_card = %{id: next_card, value: next_card}
    {:noreply, assign(socket, cards: [new_card], next_card: next_card + 1)}
  end

  def handle_event("on_card_click", params, socket) do
    %{ "card" => card } = params
    IO.inspect(card)
    {:noreply, socket}
  end

  defp get_cards do
    [
      %{
        id: 1,
        value: 1,
      },
      %{
        id: 2,
        value: 2,
      },
      %{
        id: 3,
        value: 3
      }
    ]
  end

end
