defmodule VkAPI do
	def query!(connection) do
		HTTPoison.start
		"https://api.vk.com/method/"<>
			connection.request.method_name<>"?"<>
			URI.encode_query(connection.request.parameters)<>"&"<>
			URI.encode_query(access_token: connection.request.access_token)<>"&"<>
			URI.encode_query(v: connection.request.version)
		|>HTTPoison.get!
	end
end
