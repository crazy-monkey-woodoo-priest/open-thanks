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

  def how_to_enable_a_badge(style: '', btn_class: '' )
    content_tag :a,
      class: btn_class,
      "data-target" => "#enableBadgeModal",
      "data-toggle" => "modal",
      :type => "button",
      role: "button",
      style: style do
        yield
      end
  end
end
