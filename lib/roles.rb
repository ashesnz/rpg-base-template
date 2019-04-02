class Role < Sequel::Model
  def all_roles
    Role.all.map(&:values).to_json
  end
end
