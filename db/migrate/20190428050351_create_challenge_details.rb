class CreateChallengeDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :challenge_details do |t|
      t.references :challenge, foreign_key: true
      t.bigint :frame_num, :null => false
      t.string :s3_key, :null => false
      t.string :date, :null => false

      t.timestamps
    end
    add_index :challenge_details, [:challenge_id, :frame_num], unique: true
  end
end
