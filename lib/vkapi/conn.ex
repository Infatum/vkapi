defmodule VkAPI.Conn do
  @moduledoc """
  Provides basic struct to query API
  like Plug.Conn
  """
  @current_api_version "5.53"

  @doc """
  To access the API methods VKontakte,
  You need to perform a POST or GET request for this type of:
  https://api.vk.com/method/METHOD_NAME?PARAMETERS&access_token=ACCESS_TOKEN&v=V
  All these settings are contained by ':request'.
  ':response' is filled after response from the server
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
  def new(method, params, token, api_version \\ @current_api_version) when is_binary(method)
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
