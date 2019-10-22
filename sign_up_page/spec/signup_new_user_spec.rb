# require "spec_helper"
require "selenium-webdriver"
require "rspec"

# global variables
url = "https://selenium-blog.herokuapp.com/signup"
timestamp = Time.now.to_i
username = "qwert #{timestamp}"
email = "qwert#{timestamp}@i.ua"
password = "password"
expected_banner_text = "Welcome to the alpha blog qwert #{timestamp}"

def enter_username(username)
	username_field = @driver.find_element(id: "user_username")
	username_field.send_keys(username)
end

def enter_email(email_address)
	useremail_field = @driver.find_element(id: "user_email")
	useremail_field.send_keys(email_address)
end

def enter_password(password)
	userpassword_field = @driver.find_element(id: "user_password")
	userpassword_field.send_keys(password)
end

def submit_form() 
	submit_field = @driver.find_element(id: "submit")
	submit_field.click
end

def get_banner_text()
	banner = @driver.find_element(id: "flash_success")
	banner_text = banner.text
end

# TEST: Sign up for blog
describe "Blog application" do

	describe "signup to the blog application" do
		it "confirm that a user can successfully signup" do 
			@driver = Selenium::WebDriver.for :firefox
			# driver = Selenium::WebDriver.for :remote, desired_capabilities: :firefox
			@driver.navigate.to url

			enter_username(username)
			enter_email(email)
			enter_password(password)
			submit_form()

			# Confirm user is signed up successfully
			banner_text = get_banner_text()
			expect(banner_text).to eq(expected_banner_text)

			@driver.quit
		end

		it "confirm that existing user cannot signup again" do 
			@driver = Selenium::WebDriver.for :firefox
			@driver.navigate.to url

			enter_username("qwert")
			enter_email("qwert@i.ua")
			enter_password("123")
			submit_form()

			error = @driver.find_element(class: "panel-body")
			error_text = error.text
			expect(error_text).to match(/Username has already been taken/)

			@driver.quit
		end
	end
end