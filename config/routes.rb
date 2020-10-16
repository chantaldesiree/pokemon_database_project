Rails.application.routes.draw do

  resources :trainers, only: %i[index show]


  resources :pokemons, only: %i[index show] do
    collection do
       get "search"
    end
  end

end
