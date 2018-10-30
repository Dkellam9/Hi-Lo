Rails.application.routes.draw do
  get '/start_game' => 'game#name'
  get '/game' => 'game#try'
  get '/new_game' => 'game#reset'
end
