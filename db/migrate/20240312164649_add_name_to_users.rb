class AddNameToUsers < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :name, :string, null: true

    User.reset_column_information
    User.find_each do |user|
      user.update(name: 'defaults')
    end

    change_column_null :users, :name, false
  end

  def down
    remove_column :users, :name
  end
end
