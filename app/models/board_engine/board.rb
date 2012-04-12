module BoardEngine
  class Board < ActiveRecord::Base
    # attr_accessible :title, :board_type
    acts_as_list
    has_many :articles, :dependent => :destroy
    
  end
end
