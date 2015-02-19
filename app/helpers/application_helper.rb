module ApplicationHelper
  def zfull_title(page_title = '')
    base_title = "Zhou's blog"
    if page_title.empty?
      return base_title
    else
      return "#{page_title} · #{base_title}"
    end
  end
end
