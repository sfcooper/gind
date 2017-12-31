defmodule GindWeb.AdminController do
  use GindWeb, :controller
  alias Gind.Articles

  def index(conn, _params) do
    postsdesc = Articles.posts_desc()
    allposts = Articles.list_posts()
    render(conn, "index.html", postsdesc: postsdesc, allposts: allposts)
  end
end
