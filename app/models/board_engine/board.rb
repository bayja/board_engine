# encoding: utf-8
module BoardEngine
  class Board < ActiveRecord::Base
    # attr_accessible :title, :board_type
    acts_as_list
    has_many :articles, :dependent => :destroy
    validates_uniqueness_of :title
    validates_presence_of :title, :board_type
    #BOARD_TYPE = {1 => '일반 게시판', 2 => '이미지 게시판'}
  end
end
