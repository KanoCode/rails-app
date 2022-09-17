require 'rails_helper'

RSpec.describe 'Category page', type: :feature do
  before :each do
    @user = User.new(name: 'kano', email: 'Daniel@gmail.com', password: '123456', password_confirmation: '123456')
    @user.save
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: '123456'
    click_button 'Sign up'
  end

  it 'should be able to see categories' do
    expect(page).to have_content('Categories')
  end

  it 'should be able to redirect to add new category' do
    click_link 'Add a new category'
    expect(page).to have_current_path(new_category_path)
  end

  it 'should be able to save category' do
    click_link 'Add a new category'
    fill_in 'Name', with: 'movies'
    attach_file('Icon', 'app/assets/images/pic_1.png')
    click_button 'Add Category'
    expect(page).to have_content('movies')
  end
end
