class CreateOmniauthProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :omniauth_providers do |t|
      t.belongs_to :authenticatable, polymorphic: true
      t.string :provider, limit: 128, null: false, default: ""
      t.string :uid, limit: 128, null: false, default: ""
      t.text :info
      t.text :credentials
      t.timestamps
    end
    add_index :omniauth_providers, [:provider, :uid], name: "op_prvuid"
  end
end
