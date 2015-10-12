require 'rails_helper'

feature 'Home' do
  given(:footer_content) { 'PocaPocaUnty' }
  background { visit root_path }

  scenario 'TOPにアクセスすると200が返る' do
    expect(page.status_code).to eq(200)
  end

  scenario 'TOPにアクセスするとコンテンツが表示される' do
    expect(page).to have_content(footer_content)
  end
end
