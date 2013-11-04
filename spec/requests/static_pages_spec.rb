require 'spec_helper'

describe "Static pages" do
   
  subject {page}

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'Antwerp Student Hotel' }
    let(:page_title) { '' }

    it { should_not have_title('| Home') }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "ASH"
    expect(page).to have_title(full_title(''))
  end

end