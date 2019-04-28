class CreateChallengeSummaries < ActiveRecord::Migration[5.2]
  def change
    create_table :challenge_summaries do |t|
      t.references :challenge, foreign_key: true
      t.string :s3_key, :null => false

      t.timestamps
    end
  end
end
