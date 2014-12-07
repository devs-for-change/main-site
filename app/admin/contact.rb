ActiveAdmin.register Contact do
  before_filter :skip_sidebar!
  permit_params :name, :email, :company, :role, :website, :notes

  actions :all, except: [:new]

  index do
    selectable_column
    column :name
    column :email
    column :notes
    actions
  end
end
