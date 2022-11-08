Rails.application.routes.draw do

  get '/top' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'lists/new'
  # post 'lists' => 'lists#create'
  # get 'lists' => 'lists#index'
  # .../lists/1　や　.../lists/3に該当
  # get 'lists/:id' => 'lists#show', as: 'list'
  # get 'lists/:id/edit' =>'lists#edit', as: 'edit_list'
  # 更新作業のルーティング
  # patch 'lists/:id' => 'lists#update', as:'update_list'
  # 削除のためのルーティング
  # delete 'lists/:id' => 'lists#destroy', as:'destroy_list'
resources :lists



end
