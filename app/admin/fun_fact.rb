ActiveAdmin.register FunFacts do
  before_filter :skip_sidebar!
  permit_params :left_number, :right_number, :text, :fun_fact_image

  index do
    selectable_column
    # id_column
    column :left_number
    column :right_number
    column :text
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Fun Fact Data" do
      f.input :left_number
      f.input :right_number
      f.input :text
      f.input :fun_fact_image, as: :file, hint: f.template.image_tag(f.object.fun_fact_image.url(:square))
    end

    f.actions
  end
end
