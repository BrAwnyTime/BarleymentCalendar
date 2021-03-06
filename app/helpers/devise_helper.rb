module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-danger">
      #{messages}
    </div>
    HTML

    html.html_safe
  end

  def current_user?(user)
    user == current_user
  end

end
