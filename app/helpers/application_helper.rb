module ApplicationHelper
  def link_to_active(body, url, html_options = nil, parent = nil)
    html_options ||= {}
    html_options[:class] ||= ""
    html_options[:class] += "#{' ' if html_options[:class].present?}active" if current_page?(url)
    link = link_to body, url, html_options
    link = content_tag(parent, link, :class => "#{'active' if current_page?(url)}") if parent.present?
    link
  end
end
