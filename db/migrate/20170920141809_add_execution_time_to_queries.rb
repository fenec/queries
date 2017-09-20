class AddExecutionTimeToQueries < ActiveRecord::Migration[5.1]
  def change
    add_column :queries, :execution_time, :float
  end
end
