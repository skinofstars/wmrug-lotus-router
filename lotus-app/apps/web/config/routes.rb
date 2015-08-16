
get '/',          to: 'home#index',     as: :home
get '/mounting',  to: 'home#mounting',  as: :mounting
get '/routes',    to: 'home#routes',    as: :routes
get '/resources', to: 'home#resources', as: :resources
get '/helpers',   to: 'home#helpers',   as: :helpers

resources :tracks, except: [:destroy] do
  member do
    get 'trace'
  end
end

# trace_track GET, HEAD  /tracks/:id/trace              Web::Controllers::Tracks::Trace
#      tracks GET, HEAD  /tracks                        Web::Controllers::Tracks::Index
#   new_track GET, HEAD  /tracks/new                    Web::Controllers::Tracks::New
#      tracks POST       /tracks                        Web::Controllers::Tracks::Create
#       track GET, HEAD  /tracks/:id                    Web::Controllers::Tracks::Show
#  edit_track GET, HEAD  /tracks/:id/edit               Web::Controllers::Tracks::Edit
#       track PATCH      /tracks/:id                    Web::Controllers::Tracks::Update
