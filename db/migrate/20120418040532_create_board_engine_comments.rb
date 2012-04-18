class CreateBoardEngineComments < ActiveRecord::Migration
  def change
    create_table :board_engine_comments do |t|
	    t.integer  :user_id
	    t.integer  :commentable_id
	    t.string   :commentable_type
	    t.text     :body

      t.timestamps
    end
  end
end
