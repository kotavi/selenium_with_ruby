# require "spec_helper"
require "selenium-webdriver"
require "rspec"
require_relative "signup_page.rb"
require_relative "users_page.rb"

signup = SignupPage.new(@driver)
users = UsersPage.new(driver)

# global variables
url = "https://selenium-blog.herokuapp.com/signup"
timestamp = Time.now.to_i
username = "qwert #{timestamp}"
email = "qwert#{timestamp}@i.ua"
password = "password"
expected_banner_text = "Welcome to the alpha blog qwert #{timestamp}"

def get_banner_text()
	banner = @driver.find_element(id: "flash_success")
	banner_text = banner.text
end

# TEST: Sign up for blog
describe "Blog application" do

	describe "signup to the blog application" do
		it "confirm that a user can successfully signup" do 
			# instanse variable
			@driver = Selenium::WebDriver.for :firefox
			# driver = Selenium::WebDriver.for :remote, desired_capabilities: :firefox
			@driver.navigate.to url

			signup.enter_username(username)
			signup.enter_email(email)
			signup.enter_password(password)
			signup.submit_form()

			# Confirm user is signed up successfully
			banner_text = users.get_banner_text()
			expect(banner_text).to eq(expected_banner_text)

			@driver.quit
		end

		it "confirm that existing user cannot signup again" do 
			@driver = Selenium::WebDriver.for :firefox
			@driver.navigate.to url

			signup.enter_username("qwert")
			signup.enter_email("qwert@i.ua")
			signup.enter_password("123")
			signup.submit_form()

			error = @driver.find_element(class: "panel-body")
			error_text = error.text
			expect(error_text).to match(/Username has already been taken/)

			@driver.quit
		end
	end
end