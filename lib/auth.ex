defmodule VkAPI.Auth do
	alias VkAPI.Models.{AuthParams, AuthCredentials}

  @auth_url "https://oauth.vk.com/token?grant_type=password&client_id=2274003&client_secret=hHbZxrka2uZ6jB1inYsH&"

	def authorisation_url(
		%AuthParams{
			options: %{
				app_id: app_id,
				redirect_url: redirect_url,
				settings: settings,
				version: version,
				display: display,

				type: type
       }}) do
		cond do
			type == :client || type == :standalone ->
				"https://oauth.vk.com/authorize?" <>
				URI.encode_query(client_id: app_id,
					scope: settings,
					redirect_uri: redirect_url,
					display: display,
					response_type: :token,
					v: version)
      type == :site || type == :serverside
        "https://oauth.vk.com/authorize?" <>
        URI.encode_query(client_id: app_id,
          scope: settings,
          redirect_uri: redirect_url,
          response_type: :token,
          v: version)
      type == :code
        "https://oauth.vk.com/authorize?" <>
        URI.encode_query(client_id: app_id,
          scope: settings,
          redirect_uri: redirect_url,
          response_type: :code,
          v: version)
       true -> raise "Auth type is invalid!"
    end
  end
  def authorisation_url(_), do: raise ArgumentError, "Check options in params"


  @spec authorise(string, string) :: AuthCredentials.t 
  def authorise(user, password) do
    HTTPoison.start
    data = HTTPoison.get!(@auth_url<>URI.encode_query([username: user, password: password])) 
    Poison.decode!(data.body, as: %AuthCredentials{})
  end
end