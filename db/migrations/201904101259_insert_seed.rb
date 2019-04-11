Sequel.migration do
  up do
    from(:roles).insert(username: 'test', password: 'blah', type: 'user', created_at: DateTime.now, updated_at: DateTime.now)
    from(:roles).insert(username: 'admin', password: 'test', type: 'admin', created_at: DateTime.now, updated_at: DateTime.now)
    from(:roles).insert(username: 'user', password: 'blaj', type: 'user', created_at: DateTime.now, updated_at: DateTime.now)
  end
end
