module LinksHelper
  def shortened_url(link)
    expand_link_url(link.id.to_s(32))
  end
end
