ActiveAdmin.register User do
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
    selectable_column
    id_column
    column :name
    column :email   

 #actions
  column :actions do |item|

 links = []
     links << link_to('show', admin_user_path(item))
     links << link_to('Delete', admin_user_path(item),:data => {:confirm => 'Are you sure you want to delete the user?'})
     
         

   end
  end
end
