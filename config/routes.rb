BoardEngine::Engine.routes.draw do
	namespace :admin do
		resources :boards

		scope "b/:board_title" do
			resources :articles
		end
	end

	scope "b" do
		resources :boards
		resources :articles
	end
end
