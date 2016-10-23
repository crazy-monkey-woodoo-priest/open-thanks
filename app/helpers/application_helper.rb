module ApplicationHelper
  def avatar(user, size:, url: , img_class: 'img-thumbnail')
    dimensions = case size
                 when :xs
                   '40x40'
                 when :medium
                   '120x120'
                 end

    link_to url, title: user.nickname do
      image_tag user.image_url, alt: user.nickname, size: dimensions, class: img_class
    end
  end
end
