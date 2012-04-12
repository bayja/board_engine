class CreateBoardEngineArticles < ActiveRecord::Migration
  def change
    create_table :board_engine_articles do |t|
      t.integer   :board_id
    	t.integer		:user_id
    	t.string		:title
    	t.text			:body
    	t.integer		:hit, :default => 0
    	t.boolean		:important, :default => false
      t.string    :attached_picture

      t.timestamps
    end
  end
end
