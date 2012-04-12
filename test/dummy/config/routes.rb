Rails.application.routes.draw do

  mount BoardEngine::Engine => "/board_engine"
end
