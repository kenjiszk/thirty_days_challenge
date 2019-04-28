class CreateChallengeDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :challenge_details do |t|
      t.references :challenge, foreign_key: true
      t.bigint :frame_num
      t.string :s3_key
      t.string :date

      t.timestamps
    end
  end
end
