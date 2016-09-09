module ApplicationHelper

  def notice_message
    alert_types = { notice: :success, alert: :danger}

    close_button_options = {class: "close", "data-dismiss" => "alert", "aria-hidden" => true}
    close_button = content_tag(:button, "x", close_button_options)

    alerts = flash.map do |type, message|
      alert_content = close_button + message
      alert_type = alert_types[type.to_sym] || message
      alert_class = "alert alert-#{alert_type} alert-dismissable"

      content_tag(:div, alert_content, class: alert_class)
    end
    alerts.join("\n").html_safe
  end



  
  def render_post_created_time(post)
    post.created_at.strftime("%F %T")
  end

  def render_post_updated_time(post)
    post.updated_at.strftime("%F %T")
  end


end
