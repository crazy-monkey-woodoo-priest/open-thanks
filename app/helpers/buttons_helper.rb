module ButtonsHelper
  def delete_btn(resource:)
    if resource.policy.destroy?(by: current_user)
      link_to polymorphic_path(resource), class: "btn btn-danger", title: 'Delete', data: { confirm: "Are you sure you want to remove ?" }, method: :delete do
        content_tag :i, nil, class: 'fa fa-trash'
      end
    end
  end

  def edit_btn(resource:)
    if resource.policy.edit?(by: current_user)
      link_to polymorphic_path([:edit, resource].flatten), class: "btn btn-primary", title: 'Edit' do
        content_tag :i, nil, class: 'fa fa-pencil'
      end
    end
  end

  def show_btn(resource:, text: '')
    if resource.policy.show?(by: current_user)
      link_to polymorphic_path(resource), class: "btn btn-success", title: 'View' do
        content_tag(:i, nil, class: 'fa fa-eye').concat(" #{text}")
      end
    end
  end

  def view_all_btn(path:, policy_class:)
    if policy_class.index?(by: current_user)
      link_to path, class: "btn btn-info", title: "View All" do
        content_tag(:i, nil, class: 'fa fa-list').concat(' View All')
      end
    end
  end

  def new_btn(path:, resource:)
    if resource.policy.new?(by: current_user)
      link_to path, class: "btn btn-primary", title: "Add New" do
        content_tag(:i, nil, class: 'fa fa-plus').concat(' Add New')
      end
    end
  end
end
