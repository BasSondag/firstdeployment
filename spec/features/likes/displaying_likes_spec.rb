require 'rails_helper'
RSpec.describe 'displaying likes' do
  before do
    @user = create_user
    log_in @user
    @secret = @user.secrets.create(conten: 'Oops')
    Like.create(user: @user, secret: @secret)
  end
  it 'displays amount of likes next to each secret' do
    visit '/secrets'
    expect(page).to have_text(@secret.conten)
    expect(page).to have_text('1 likes')
    visit "/users/#{@user.id}"
    expect(page).to have_text(@secret.conten)
    expect(page).to have_text('1 likes')
  end
end