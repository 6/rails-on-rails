module ApplicationHelper
  def link_to_active(body, url, html_options = {})
    html_options[:class] ||= ""
    html_options[:class] += "#{' ' if html_options[:class].present?}active" if current_page?(url)
    link_to body, url, html_options
  end
end
