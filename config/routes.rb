Rails.application.routes.draw do
  get "/" => "application#home"
  get "/process_action" => "application#action"
end
