defmodule VkAPI.Status do
  use VkAPI.General

  @moduledoc """
  Module represents queries to status
  """


  @doc """
  Gets user status. 
  """
  @spec get(%VkAPI.Conn{}, binary|integer) :: %VkAPI.Conn{}
  def get(conn, user_id) do
    conn |> set_request("status.get", [user_id: user_id])
  end

  @doc """
  Gets group status. 
  """
  @spec get(%VkAPI.Conn{}, binary|integer, binary|integer) :: %VkAPI.Conn{}
  def get(conn, user_id, group_id) do
    conn |> set_request("status.get", [user_id: user_id, group_id: group_id])
  end
end