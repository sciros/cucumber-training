#exercise
Given /^I can register a new user$/ do
  visit Registration do |page|
    @new_username = 'batman' +Random.rand(10000).to_s
    page.register_with(@new_username,'P4ssw0rd')
  end
end