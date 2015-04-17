require 'rails_helper'

feature 'Home' do
  given(:footer_content) { 'PocaPocaUnty' }

  scenario 'TOPにアクセスすると200が返る' do
    visit root_path
    expect(page.status_code).to eq(200)
  end

  scenario 'TOPにアクセスするとコンテンツが表示される' do
    visit root_path
    expect(page).to have_content(footer_content)
  end
end
