module ApplicationHelper
  def zfull_title(page_title = '')
    base_title = "Zhou's blog"
    if page_title.empty?
      return base_title
    else
      return "#{page_title} · #{base_title}"
    end
  end


  #markdown support and code highlighting support
  #CodeRayify for code highlighting support
  #Redcarpet for markdown
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(:line_numbers => :table)
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(:filter_html => true,
                                  :hard_wrap => true)
    options = {
        :fenced_code_blocks => true,
        :no_intra_emphasis => true,
        :autolink => true,
        :strikethrough => true,
        :lax_html_blocks => true,
        :superscript => true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end

end
