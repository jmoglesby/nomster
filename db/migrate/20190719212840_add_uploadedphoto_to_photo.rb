class AddUploadedphotoToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :uploaded_photo, :string
  end
end
