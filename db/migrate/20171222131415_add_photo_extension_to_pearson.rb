class AddPhotoExtensionToPearson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :extension, :string
  end
end
