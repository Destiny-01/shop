ActiveAdmin.register Product do

  permit_params :title, :image, :description, :price
  
end
