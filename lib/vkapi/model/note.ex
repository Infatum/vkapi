defmodule VkAPI.Model.Note do
  @derive [Poison.Encoder]

  defstruct [:id, :owner_id, :title, :text,
             :date, :camments, :read_comments, :view_url]

  @type t :: %Note{
    id:            integer,
    owner_id:      integer,
    title:         binary,
    text:          binary,
    date:          integer,
    camments:      integer,
    read_comments: integer,
    view_url:      binaty
  }
end
