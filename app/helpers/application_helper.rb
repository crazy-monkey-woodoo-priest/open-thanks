module ApplicationHelper
  def avatar(user, size:, url: user.url)
    dimensions = case size
                 when :xs
                   '40x40'
                 end

    link_to url, title: user.nickname do
      image_tag user.image_url, alt: user.nickname, size: dimensions
    end
  end
end
