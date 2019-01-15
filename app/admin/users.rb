ActiveAdmin.register User do
 permit_params :name, :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :member_since do |u|
      time_ago_in_words(u.created_at)
    end
    column :expensesSheets do |u|
      count = u.expensesSheets.count
      count.zero? ? '' : count
    end
    actions
  end

  form do |f|
    f.inputs 'User' do
      f.input :name
      f.input :email
      f.input :password
    end
    f.actions
  end

  controller do
    def update
      if (params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
        params[:user].delete("password")
        params[:user].delete("password_confirmation ")
      end
      super
    end
  end

  filter :name
  filter :email
  filter :created_at
  filter :updated_at
end
