ActiveAdmin.register TermsAndCondition do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description
  #
  # or

  form do |f|
    f.inputs 'Terms and Conditions' do
      f.input :title
      f.input :description, as: :quill_editor
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :description
  end

  show do 
    attributes_table do 
      row :title
      row :description
    end
  end



  #
  # permit_params do
  #   permitted = [:title, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
