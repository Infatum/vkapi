defmodule VkAPI.General do
  defmacro __using__(_opts) do
    quote do
      @api_version "5.53"

      @type params :: [{atom, binary|integer}]

      @spec set_method(%VkAPI.Conn{}, binary) :: %VkAPI.Conn{}
      defp set_method(conn, method) do
        put_in(conn.request[:method], method)
      end

      @spec set_version(%VkAPI.Conn{}) :: %VkAPI.Conn{}
      defp set_version(conn) do
        put_in(conn.request[:version], @api_version)
      end

      @spec set_params(%VkAPI.Conn{}, params) :: %VkAPI.Conn{} 
      defp set_params(conn, params) do
        put_in(conn.request[:params], params)
      end

      defp set_request(conn, method, params) do
        conn
        |> set_method(method)
        |> set_version
        |> set_params(params)
      end
    end
  end
end
