class AddColumnToChallengeDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :challenge_details, :comment, :text, :after => :url, null: false
  end
end
