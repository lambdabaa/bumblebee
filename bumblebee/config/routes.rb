Bumblebee::Application.routes.draw do
  match "/ping/:id" => "pings#show"
  match "/ping" => "pings#create"
end
