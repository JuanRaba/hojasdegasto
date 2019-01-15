ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # to add more watch https://activeadmin.info/12-arbre-components.html
    columns do
      column do
        panel "Recent 5Expenses" do
          ul do
            Expense.last(5).map do |expense|
              li expense.show_name
            end
          end
        end
      end

      column do
        panel "Recent 5Users" do
          ul do
            User.last(5).map do |u|
              li link_to(u.show_name, admin_user_path(u))
            end
          end
        end
      end

      column do
        panel "Expense count" do
          ul do
            li "Expenses creados: #{Expense.count}"
            li "ExpensesSheet creados: #{ExpensesSheet.count}"
          end
        end
      end

    end

  end # content
end
