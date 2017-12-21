class Sprint1Migration < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.timestamps
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :remember_token
      t.string :phone
      t.boolean :phone_verified, default: false
      t.boolean :phone_unsubscribe, default: false
      t.boolean :gender
      t.date :birthday
      t.string :avatar
      t.boolean :staff, default: false
      t.boolean :active, default: true
      t.string :school
      t.string :organization
      t.date :graduation_date
      t.integer :order_count, default: 0

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet :current_sign_in_ip
      t.inet :last_sign_in_ip

      # Confirmable
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email # Only if using reconfirmable

      # Omiauth
      t.string :provider
      t.string :uid
    end

    create_table :time_zones do |t|
      t.string :name
    end

    create_table :countries do |t|
      t.timestamps
      t.string :name
    end

    create_table :states do |t|
      t.timestamps
      t.integer :country_id
      t.string :abbr
      t.string :name
    end

    create_table :airports do |t|
      t.timestamps
      t.string :name
      t.string :code
      t.string :city
      t.integer :state_id
      t.integer :country_id
      t.integer :time_zone_id
    end

    create_table :schools do |t|
      t.timestamps
      t.string :name
      t.string :slug
      t.string :web_address
      t.string :address
      t.string :city
      t.integer :state_id
      t.integer :country_id
      t.string :zip
      t.string :phone
      t.string :latitude
      t.string :longitude
      t.integer :admin_id
    end

    create_table :organizations do |t|
      t.timestamps
      t.integer :school_id
      t.string :name
      t.string :slug
      t.string :web_address
      t.string :address
      t.string :city
      t.integer :state_id
      t.integer :country_id
      t.string :zip
      t.string :phone
      t.string :latitude
      t.string :longitude
    end

    # Add indexes
    add_index :users, [:email], unique: true, using: :btree
    add_index :users, [:remember_token], using: :btree
    add_index :users, :reset_password_token, unique: true, using: :btree
    add_index :users, :confirmation_token, unique: true, using: :btree
    add_index :schools, [:slug, :state_id, :country_id], using: :btree
    add_index :organizations, [:slug, :state_id, :country_id], using: :btree
  end
end
