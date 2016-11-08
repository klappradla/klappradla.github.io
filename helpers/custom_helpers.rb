module CustomHelpers
  LINK_MATCHER = /\[.*?\]/
  def link_list(links)
    links = links.map { |txt, url| link_to(txt, url, target: :_blank) }
    links.join(', ').html_safe
  end

  def auto_link(text, links)
    text = text.gsub(/\[.*?\]/) do |link|
      link_to(strip_txt(link), links[to_key(link)], target: :_blank)
    end
    simple_format(text.html_safe)
  end

  def to_key(link_txt)
    strip_txt(link_txt).downcase
  end

  def strip_txt(link_txt)
    link_txt.delete('[]')
  end
end
