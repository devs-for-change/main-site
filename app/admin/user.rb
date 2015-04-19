ActiveAdmin.register User do
  before_filter :skip_sidebar!
  permit_params :email, :password, :password_confirmation, :profile_image, :profile_order, *User::STRING_FIELDS

  index do
    selectable_column
    # id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "User Basics" do
      f.input :first_name
      f.input :last_name
      f.input :title
      f.input :email
      f.input :profile_image, as: :file, hint: f.template.image_tag(f.object.profile_image.url(:square))
      f.input :hover_profile_image, as: :file, hint: f.template.image_tag(f.object.hover_profile_image.url(:square))
    end
    f.inputs "User Personal Information" do
      f.input :biography
      f.input :address_line_1
      f.input :address_line_2
      f.input :postal_code
      f.input :state_province
      f.input :country
      f.input :primary_phone
      f.input :profile_order
    end
    f.inputs "User Authentication (Leave blank if unchanged)" do
      f.input :password
      f.input :password_confirmation
    end

    f.inputs "Social Media Links" do
      f.input :facebook_url
      f.input :twitter_url
      f.input :linkedin_url
    end

    f.actions
  end

  # These overrides are to allow devise to not require a password and confirmation.
  controller do
    def update
      if update_user
        redirect_to resource_path(resource), notice: "User '#{resource.email}' was successfully updated"
      else
        render action: :edit
      end
    end

    def update_user
      meth = changing_password? ? :update_with_password : :update_without_password
      resource.send(meth, permitted_params[:user])
    end

    def changing_password?
      params[:user][:password].present?
    end
  end

end
