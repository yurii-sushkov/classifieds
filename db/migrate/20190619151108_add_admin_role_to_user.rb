# frozen_string_literal: true

class AddAdminRoleToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
