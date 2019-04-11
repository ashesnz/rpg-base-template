Sequel.migration do
  up do
    alter_table(:roles) do
      add_column(:password, String)
      rename_column(:name, :username)
    end
  end
end