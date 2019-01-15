ActiveAdmin.register Asociation do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :user_id, :expenses_sheet_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  index do
    selectable_column
    id_column
    column :user do |a|
      a.user.show_name
    end
    column :expenses_sheet do |a|
      a.expensesSheet.name
    end
    column :created_at
    column :member_since do |a|
      time_ago_in_words(a.created_at)
    end
    actions
  end
end
