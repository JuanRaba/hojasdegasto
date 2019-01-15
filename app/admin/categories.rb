ActiveAdmin.register Category do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    column :id
    column :name
    column :member_since do |c|
      time_ago_in_words(c.created_at)
    end
    column :updated do |c|
      (c.updated_at != c.created_at) ? c.updated_at : ''
    end
    column :used_times do |c|
      count = c.expenses.count
      count.zero? ? '' : count
    end
    actions
  end

end
