class CreateOmniauthIdentities < ActiveRecord::Migration[7.0]
  def change
    create_table :omniauth_identities do |t|
      t.belongs_to :authenticatable, polymorphic: true
      t.string :email, limit: 128, null: false, default: ""
      t.string :password_digest, limit: 128
      t.timestamps
    end
    add_index :omniauth_identities, [:email], name: "oi_em"
  end
end
