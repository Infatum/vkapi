defmodule VkAPI.Models.AuthCredentials do
	@derive [Poison.Encoder]
	
  defstruct [:access_token, :expires_in, :user_id]

  @type t :: %AuthCredentials{
    access_token: binary, 
    expires_in: integer, 
    user_id: integer
  }
end