if User.count == 0
  (1..19).each do |e|
    u = User.new(email: "user#{e}@mailinator.com", first_name: "#{e}", middle_name: 'temp',
                 last_name: 'user', phone: '2222222222', gender: :false,
                 birthday: Date.today - 18.years,
                 graduation_date: Date.today + 2.years,
                 password: '123456',
                 staff: false)
    u.save
  end
  (1..9).each do |e|
    u = User.new(email: "admin#{e}@mailinator.com", first_name: "#{e}", middle_name: 'temp',
                 last_name: 'admin', phone: '2222222222', gender: :false,
                 birthday: Date.today - 18.years,
                 graduation_date: Date.today + 2.years,
                 password: '123456',
                 staff: true)
    u.save
  end
end