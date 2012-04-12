class CreateBoardEngineBoards < ActiveRecord::Migration
  def change
    create_table :board_engine_boards do |t|
    	t.string		:title
    	t.integer		:board_type
    	t.integer		:position

      t.timestamps
    end
  end
end
