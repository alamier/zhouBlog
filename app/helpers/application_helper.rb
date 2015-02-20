module ApplicationHelper
  def zfull_title(page_title = '')
    base_title = "Zhou's blog"
    if page_title.empty?
      return base_title
    else
      return "#{page_title} · #{base_title}"
    end
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                       no_intra_emphasis:true,
                                       fenced_code_blocks:true,
                                       disable_indented_code_blocks:true)
    return markdown.render(text).html_safe
  end


end
