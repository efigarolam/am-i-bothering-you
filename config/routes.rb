Rails.application.routes.draw do

  root 'cool_down_bro#index'

  post controller: :cool_down_bro, action: :create, as: :complaints

end

