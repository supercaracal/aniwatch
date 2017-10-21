require 'rails_helper'

describe ApplicationController do
  let(:footer_content) { 'PocaPocaUnty' }

  before { visit root_path }

  it 'TOPにアクセスすると200が返る' do
    expect(page.status_code).to eq(200)
  end

  it 'TOPにアクセスするとコンテンツが表示される' do
    expect(page).to have_content(footer_content)
  end
end
