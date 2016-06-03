class AddContestToMatch < ActiveRecord::Migration
  def change
    add_reference :matches, :contest, index: true, foreign_key: true
  end
end
