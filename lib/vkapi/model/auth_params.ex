defmodule VkAPI.Model.AuthParams do
  defstruct config: %{}, options: %{}

  @default_client_redirect_url "https://oauth.vk.com/blank.html"
end
