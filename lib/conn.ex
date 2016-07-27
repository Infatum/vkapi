defmodule VkAPI.Conn do
  @moduledoc """
  Предоставляет основной struct для выполнения запросов к API
  Наподобие Plug.Conn
  """

  @doc """
  Чтобы обратиться к методу API ВКонтакте,
  Вам необходимо выполнить POST или GET запрос такого вида:
  https://api.vk.com/method/METHOD_NAME?PARAMETERS&access_token=ACCESS_TOKEN&v=V
  Все указанные параметры содержатся в request.
  После выполнения запроса response заполнится ответом от сервера
  """
  defstruct %VkAPI.Conn{
    request: %{
      method_name: nil,
      parameters: %{},
      access_token: nil,
      api_version: nil
    },
    response: %{}
  }


  @doc """
  Creates new %VkAPI.Conn{} structure to make requests to Vk API.
  """
  def new(method, params, token, api_version) when is_binary(method)
    and is_tuple(params) and is_number(api_version) do
    %VkAPI.Conn{
      request: %{
        method_name: method,
        parameters: params,
        access_token: token,
        api_version: api_version
      },
    }
  end
end
