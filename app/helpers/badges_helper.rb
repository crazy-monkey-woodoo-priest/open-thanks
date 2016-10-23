module BadgesHelper
  def badge_colapse_btn(text:, index:, suffix:)
    content_tag :button, text, class: "btn btn-sm btn-primary",
      "aria-controls" => "colapse-badge-#{index}-#{suffix}",
      "aria-expanded" => "false",
      "data-target" => "#colapse-badge-#{index}-#{suffix}",
      "data-toggle" => "collapse",
      :suffix => "button"
  end

  def badge_textarea(index:, suffix:)
    content_tag :div, id: "colapse-badge-#{index}-#{suffix}", class: 'collapse' do
      content_tag :textarea, readonly: 'readonly', class:"form-control", rows:"2" do
        yield
      end
    end
  end

  def badge_textarea_md(index:, suffix:, receiver:)
    badge_textarea index: index, suffix: suffix do
      %Q{[![Open Thanks](#{badge_image(index)})](#{stable_url(receiver)})}
    end
  end

  def badge_textarea_html(index:, suffix:, receiver:)
    badge_textarea index: index, suffix: suffix do
      %Q{<a href="#{stable_url(receiver)}"><img src="#{badge_image(index)}" alt="Open Thanks"></a>}
    end
  end
end
