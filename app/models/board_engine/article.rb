# encoding: utf-8

module BoardEngine
  class Article < ActiveRecord::Base
  	# FIXME: engine에서 에디터불러오면 삽입 이미지의 model명을 제대로 못 가져옴
	  include CleditorWithPicture::AssociateWithEditorPicture
  	mount_uploader :attached_picture, ArticlePictureUploader
    attr_accessible :title, :body, :child_picture_ids, :attached_picture

    belongs_to :board
    belongs_to :user
    has_many	 :comments, :as => :commentable, :dependent => :destroy
    
    validates_presence_of :title, :body, :board_id
  end
end
