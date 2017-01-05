#require 'test_helper'
require 'spec_helper'
require 'rails_helper'
require "capybara/dsl"
require "selenium-webdriver"
require 'capybara/rspec'

Capybara.default_max_wait_time = 15
Capybara.default_selector = :css

class ConversationTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  describe "Conversation" do
    subject { page }

    describe "home page", js: true, type: :job do
      before do
        #using_wait_time(10)
        sign_in User.first
        visit root_path
        find(:css,'.hide-chat-btn').click
        #find(:css, '.user-list').visible?
        puts find(:css, '.user-list').visible?
 #       using_wait_time(10) do
        click_link('ixsiwat@gmail.com')
        #end
        find('#dropdownMenu2').click
        #puts find('.navbar-fixed-bottom').visible?
        fill_in ("message_content"), with: "some message"
        puts "###"+ find(".message_content").text
      end

      it "should create a message" do
        find('input.message_button').click
        sleep 140.0
        puts Message.count
        expect { find('input.message_button').click}.to change(Message, :count).by(1)
      end
    end
  end
end