class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user, index: true
      t.references :user, index: true

      t.timestamps
    end
  end

  def new_name
    change_table :friendships do |t|
      t.rename :user, :user_id
      t.rename :user, :friend_id
   
    end
  end
end
