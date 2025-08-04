class RenameTypeToWordType < ActiveRecord::Migration[7.0]
  def change
    rename_column :words, :type, :word_type
  end
end
