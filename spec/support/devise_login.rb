def capy_login
  visit admin_root_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Login'
end
