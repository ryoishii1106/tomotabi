ActiveAdmin.register User do
  permit_params :email, :password, :accepted, :name, :self_introduction, :avatar
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :accepted
      f.input :name
      f.input :self_introduction
      f.input :avatar
    end
    f.actions
  end
end
