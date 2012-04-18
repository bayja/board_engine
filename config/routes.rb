BoardEngine::Engine.routes.draw do
	namespace :admin do
		scope "b" do
			resources :boards
			resources :comments
		end

		scope "b/:board_title" do
			resources :articles
		end
	end

	scope "b" do
		resources :boards
		resources :comments
	end
	
	scope "b/:board_title" do
		resources :articles
	end
end
