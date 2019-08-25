class RenameS3KeyToUrl < ActiveRecord::Migration[5.2]
  def change
    rename_column :challenge_details, :s3_key, :url
    rename_column :challenge_summaries, :s3_key, :url
  end
end
