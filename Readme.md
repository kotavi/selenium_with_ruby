# Learning Selenium With Ruby

To see the full course go to 
https://www.linkedin.com/learning/learning-selenium

### Environment preparation

#### Ruby
https://rubygems.org/gems/selenium-webdriver

1. Open file `selenium_ruby/environment_preparation/Gemfile` and paste command from https://rubygems.org/gems/selenium-webdriver for GEMFILE
It should be something like this:

`gem 'selenium-webdriver', '~> 3.142', '>= 3.142.6'`

File content should look like his
```
source 'https://rubygems.org'
	gem 'selenium-webdriver', '~> 3.142', '>= 3.142.6'
```

In my case versions that were copied from rubygems site didn't work. 
Versions that worked:

```
source 'https://rubygems.org'
	gem 'selenium-webdriver', '~> 3.6'
  	gem 'rspec', '~> 3.7'
```

2. Open terminal
3. Navigate to the folder with Gemfile
4. Execute the next two commands

```
gem install bundler
bundle install
```

#### Gecko Driver

https://github.com/mozilla/geckodriver/releases/tag/v0.26.0

```
$ geckodriver -V
geckodriver 0.24.0

The source code of this program is available from
testing/geckodriver in https://hg.mozilla.org/mozilla-central.

This program is subject to the terms of the Mozilla Public License 2.0.
You can obtain a copy of the license at https://mozilla.org/MPL/2.0/.
```

#### Install RSpec

https://rubygems.org/gems/rspec

RSpec is a 'Domain Specific Language' (DSL) testing tool written in Ruby to test Ruby code. It is a behavior-driven development (BDD) framework which is extensively used in production applications.

Add the next code to Gemfile

```
source 'https://rubygems.org'
	gem 'selenium-webdriver', '~> 3.6'
  	gem 'rspec', '~> 3.7'
```

And execute `$ bundle install`

### Run test

## To execute the tests

- to execute all tests in the specification

`rspec ../sign_up_page/spec/signup_new_user_spec.rb`

- to execute test cases starting from specific line

`rspec ../sign_up_page/spec/signup_new_user_spec.rb:30`

where 30 represents the line of the test I want the execution to run from.

- to run specfic test case (with tags)

https://stackoverflow.com/questions/5069677/how-do-i-run-only-specific-tests-in-rspec/22113489


### Useful links:

https://rspec.info/documentation/3.9/rspec-expectations/
https://github.com/rspec/rspec-expectations#regular-expressions



