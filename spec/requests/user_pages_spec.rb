require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before do 
      visit signup_path
    end

    specify { expect(page).to have_content('Sign up') }

  end

  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }
  # Replace with code to make a user variable
    before do 
      visit user_path(user)
    end

    specify { expect(page).to have_content(user.name) }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end


end