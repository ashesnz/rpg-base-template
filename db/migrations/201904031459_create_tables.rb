Sequel.migration do
  up do
    create_table(:roles) do
      primary_key :id
      String      :name,        size: 50, null: false
      String      :type,        size: 20, null: false
      DateTime    :created_at,  null: false
      DateTime    :updated_at,  null: false
    end
  end
end
