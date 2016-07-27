defmodule VkAPI.UserPool do
  use GenServer

  @moduledoc """
  Pool of users. Helps register and manage all users and tokens

  ## Examples

      {:ok, user_pool} = VkAPI.UserPool.start_link

      user_pool |> VkAPI.UserPool.auth(token: "mytoken", alias: :user1)
      user_pool |> VkAPI.UserPool.auth(username: "+1234567892", password: "12345678", alias: user2)

      user_pool |> VkAPI.UserPool.with_user(:user1) #returns %VkAPI.Conn{request: %{token: "mytoken"}}
      user_pool |> VkAPI.UserPool.with_user(:user2) #returns %VkAPI.Conn{request: %{token: "obtained_user2_token"}}

  """


  ## Client API

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def with_user(pid, name) do
    GenServer.call(pid, {:with_user, name})
  end

  def auth(pid, username: username, password: password, alias: name) do
  	GenServer.cast(pid, {:auth, [username: username, password: password, alias: name]})
  end

  def auth(pid, token: token, alias: name) do
  	GenServer.cast(pid, {:auth, [token: token, alias: name]})
  end

  ## Server callbacks

  def init(_) do
  	{:ok, %{}}
  end

  def handle_cast({:auth, [username: username, password: password, alias: name]}, register) do
  	{:noreply, Map.put(register, name, VkAPI.Auth.authorise(username, password).access_token)}
  end

  def handle_cast({:auth, [token: token, alias: name]}, register) do
    {:noreply, Map.put(register, name, token)}
  end

  def handle_call({:with_user, name}, _form, register) do
    {:ok, token} = Map.fetch(register, name)
    {:reply, %VkAPI.Conn{request: %{access_token: token}}, register}
  end
end