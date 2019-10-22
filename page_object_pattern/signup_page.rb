class SignupPage

# css selectors

USERNAME_FIELD = {id: "user_username"}
EMAIL_FIELD = {id: "user_email"}
PASSWORD_FIELD = {id: "user_password"}
SUBMIT_BUTTON = {id: "submit"}

attr_reader :driver

def initialize(driver)
	@driver = driver
end

def enter_username(username)
	username_field = @driver.find_element(USERNAME_FIELD)
	username_field.send_keys(username)
end

def enter_email(email_address)
	useremail_field = @driver.find_element(EMAIL_FIELD)
	useremail_field.send_keys(email_address)
end

def enter_password(password)
	userpassword_field = @driver.find_element(PASSWORD_FIELD)
	userpassword_field.send_keys(password)
end

def submit_form() 
	submit_field = @driver.find_element(SUBMIT_BUTTON)
	submit_field.click
end

end
