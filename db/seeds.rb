Admin.find_or_create_by(id: 1) do |admin|
  admin.email = "admin0000@admin.com"
  admin.password = "admin0000"
 end