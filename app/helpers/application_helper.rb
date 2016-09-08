module ApplicationHelper
  def render_post_created_time(post)
    post.created_at.strftime("%F %T")
  end

  def render_post_updated_time(post)
    post.updated_at.strftime("%F %T")
  end
end
