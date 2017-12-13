Rails.application.routes.draw do
  root 'welcome#index'
  post "/search" => "search#index"

end
