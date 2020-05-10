class CreateOktaAuthentications < ActiveRecord::Migration[6.0]
  def change
    create_table :okta_authentications do |t|
      t.string :account_name
      t.jsonb :data

      t.timestamps
    end
  end
end
