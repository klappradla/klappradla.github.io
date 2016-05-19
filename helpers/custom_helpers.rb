module CustomHelpers
  def link_list(links)
    output = []
    links.each do |link|
      output << link_to(link.txt.downcase, link.link, target: :_blank)
    end
    output.join(', ').html_safe
  end
end
