BoardEngine::Engine.routes.draw do
	namespace :admin do
		scope "b" do
			resources :boards
		end

		scope "b/:board_title" do
			resources :articles
		end
	end

	scope "b" do
		resources :boards
	end
	
	scope "b/:board_title" do
		resources :articles
	end
end
