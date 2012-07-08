Bumblebee::Application.routes.draw do
  match "/ping" => "pings#create"
end
