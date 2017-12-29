defmodule GindWeb.PageController do
  use GindWeb, :controller
  alias Gind.Articles

  def index(conn, _params) do
    lastpost = Articles.posts_last()
    postsdesc = Articles.posts_desc()
    render(conn, "index.html", postsdesc: postsdesc, lastpost: lastpost)
  end
end
