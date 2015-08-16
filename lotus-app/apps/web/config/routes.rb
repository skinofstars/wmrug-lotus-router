get '/', to: 'home#index', as: :home

get '/resources', to: 'home#resources', as: :resources
get '/routes', to: 'home#routes', as: :routes
get '/mounting', to: 'home#mounting', as: :mounting

  #       home GET, HEAD  /                              Web::Controllers::Home::Index

resources :tracks

  #     tracks GET, HEAD  /tracks                        Web::Controllers::Tracks::Index
  #  new_track GET, HEAD  /tracks/new                    Web::Controllers::Tracks::New
  #     tracks POST       /tracks                        Web::Controllers::Tracks::Create
  #      track GET, HEAD  /tracks/:id                    Web::Controllers::Tracks::Show
  # edit_track GET, HEAD  /tracks/:id/edit               Web::Controllers::Tracks::Edit
  #      track PATCH      /tracks/:id                    Web::Controllers::Tracks::Update
  #      track DELETE     /tracks/:id                    Web::Controllers::Tracks::Destroy
