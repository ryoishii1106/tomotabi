ActiveAdmin.register User do
  permit_params :email, :password, :accepted, :name, :self_introduction, :avator
end
