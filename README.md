### Overview

This provides a comprehensive guide on using GitHub Copilot to enhance your GitHub Actions workflows. It uses a Ruby on Rails framework. The main goal is to leverage GitHub Copilot for setting up and managing GitHub Actions, ensuring continuous integration and streamlined development processes.

Please, if you want to go through the process step-by-step, as this is the purpose of this guide, jump to a [Getting Started with Ruby on Rails](#getting-started) section. Then, follow each steps and sections, the final and main goal is to set up and manage GitHub Actions with GitHub Copilot.

### Key Features and Benefits

- **Automated Workflows**: Streamline your development process with automated workflows, reducing manual intervention and increasing efficiency.
- **Continuous Integration**: Ensure code quality and functionality with continuous integration, catching issues early in the development cycle.
- **Seamless Integration with GitHub**: Leverage GitHub's powerful ecosystem to manage your code, track issues, and collaborate with your team.
- **Enhanced Productivity**: Use GitHub Copilot to write code faster and with fewer errors, allowing you to focus on more complex tasks.
- **Customizable Workflows**: Tailor your GitHub Actions workflows to fit your specific project needs, ensuring maximum flexibility and control.
- **Comprehensive Documentation**: Access detailed documentation and examples to help you get the most out of GitHub Copilot and GitHub Actions.
- **Scalability**: Easily scale your workflows as your project grows, ensuring that your development processes can handle increased complexity and volume.
- **Security**: Implement security best practices in your workflows to protect your code and data from vulnerabilities.

### Users API

This is a Ruby on Rails API application for managing users. Below are the steps necessary to get the application up and running.

### Ruby/Rails Versions

<a href="https://www.ruby-lang.org/pt/">
  <img alt="Ruby" src="https://img.shields.io/badge/Ruby-3.3.0-brightgreen" target="_blank">
</a>

<a href="https://rubyonrails.org/">
  <img alt="Ruby on Rails" src="https://img.shields.io/badge/Rails-7.1.5-brightgreen" target="_blank">
</a>

**Note:** Make sure to have the Ruby 3.3.0 version installed on your machine and Ruby on Rails 7.1 Gem version. These are the only dependencies for this project.

### Configuration

`git clone` the repository and run `bundle install` to install the dependencies, after that you can run the application with `rails s` or `rails server`.

Go to `http://localhost:3000` to see the application running. To access the API, go to `http://localhost:3000/api/users`.

### Database

`rails db:create` to create the database.

`rails db:migrate` to run the migrations.

To create users using the Rails console, run `rails c` or `rails console`, and then:

```ruby
User.create(name: 'John Doe', email: 'john.doe@example')
```

### Test Suite

To run the test suite, run `rspec` in the terminal.

If you want to run a specific test file, you can run `rspec path/to/file_spec.rb`, for example: `rspec spec/models/user_spec.rb`.

### Rubocop

To run Rubocop, run `rubocop` in the terminal.

To fix the offenses automatically, run `rubocop -a`, be careful with this command, it will change your files.

# Module 1: GitHub Copilot for Ruby on Rails Session

### <a id="getting-started"></a> Getting Started with Ruby on Rails 💎

1. Create a rails api application: `@terminal /explain how can I create a ruby on rails api application using the rails command line, use users-api as the application name`

2. How can I run the rails server: `@terminal /explain how can I run the rails server using the rails command line`

3. Where are the routes? `/explain where are located the routes/endpoints for ruby on rails application?`

4. Creating the /api endpoint base path: `create the /api base endpoint path in config/routes.rb file`

5. How can I create a /api/users controller? `@terminal /explain how can I create a /api/users controller in ruby on rails?`

6. Generate all the CRUD actions for the users controller: `in the #file:users_controller.rb file, generate all actions`

7. How can I create a user model? `@terminal /explain how can I create a user model in ruby on rails?`

8. What is the command to create users from terminal? `@terminal /explain what is the command to create users from terminal in ruby on rails?`

9. How can I serializer or filtered the JSON fields to return? `how can I serializer or filtered the JSON fields to return in ruby on rails?`

### Testing with RSpec 🛠️

1. What is the /test folder? `@workspace what is the /test folder?`

2. Set up Rspec with the Gemfile selected on Copilot Chat: `@workspace How can I set up the testing framework with RSpec tests?`

> **Note: Use RSpec version 7.0.0**

3. Delete test folder? `@workspace Since I installed the rspec, do I need this test folder?`

4. RSpec has a generator to create tests? `@workspace Does RSpec have a generator to create tests like user model?`

5. Open the **app/models/user.rb** and "force" Copilot to add the validations: `@workspace Can you add some validations to the user model?`, try to seek something like `validates :name, presence: true` and `validates :email, presence: true, uniqueness: true`

6. Select the **app/models/user.rb** and ask to Copilot Chat: `based on #file:user.rb, generate all the tests for it`

7. Request to write some tests: `@workspace Can you write some tests for the user model?`

> **Note:** Select the **app/models/user.rb file**, when Copilot gives you the suggestion, click on **Apply in Editor** and **Accept Changes**.

6. Run the tests to validate it.

7. Requesting verbose output for the tests: `@workspace Can you provide a verbose output for the tests?`

### Rubocop static code analyzer (a.k.a. linter) 🚨

1. Asking about linters in Ruby: `@workspace which kind of linter can I use for ruby?`

> **Note:** Sometimes, Copilot will suggest Rubocop as the linter and will provide the steps to set it up. Making unnecessary to ask the question below about set up Rubocop.

2. Set up Rubocop with the Gemfile selected on Copilot Chat: `@workspace How can I set up the Rubocop static code analyzer?`

3. Customizing the cops and other advanced strategies: `@workspace tell me more about the customization in the file .rubocop.yml`

4. Asking to include/exclude folders/files: `@workspace instead of using allcops exclude, can I define just the include ones?`

5. Run Rubocop to validate the code.

6. Requesting the autocorrect feature: `@workspace Can you run the Rubocop with the autocorrect feature?`

### SimpleCov - Test Coverage 📊

1. What is the recommendation Gem for code coverage in Ruby? `What Ruby gem is used for code coverage with test suites?`

2. Setting up SimpleCov for Code Coverage with RSpec: `@workspace How do I integrate the SimpleCov gem to track code coverage with RSpec?`

**Note:** Add just the code below for the first time running the tests with code coverage:

Into the **spec/spec_helper.rb** file:

```ruby
# SimpleCov is a code coverage analysis tool for Ruby.
require 'simplecov'
SimpleCov.start 'rails'
```

2.1 Run the tests to validate the code coverage. Open the file **coverage/index.html** to see the code coverage.

2.2 Copilot will suggest something like this into the **spec/spec_helper.rb** file:

```ruby
# SimpleCov is a code coverage analysis tool for Ruby.
require 'simplecov'
SimpleCov.start 'rails' do
  # Exclude the channels folder
  add_filter 'app/channels/'
  add_filter 'app/jobs/'
  add_filter 'app/mailers/'
  add_filter 'app/controllers/application_controller.rb'
end
```

2.3 Run again the tests to validate the code coverage. Look at the **coverage/index.html** file to see the code coverage.

3. Requesting the best approach for achieving effective code coverage in test suites: `In software engineering, what is the recommended minimum code coverage threshold for testing, and what are the best practices for setting and maintaining it?`

4. Add to .gitignore the coverage folder: `@workspace Can you add the coverage folder to the .gitignore file?`

Or, grab the code from [A collection of useful .gitignore templates](https://github.com/github/gitignore)

# Module 2: GitHub Copilot for GitHub Actions Session

### Get Started with GitHub Actions 🧪

1. Starting from basic: `@workspace Does GitHub Copilot has oficial integration with GitHub Actions?`

2. How can I create a new workflow for Rubocop and Rspec? `@workspace Can you help me set up two separate GitHub Actions workflows for running RuboCop and RSpec tests in my Ruby on Rails project? I want them both to trigger on every push and pull request to any branch.`

3. Push the changes to the repository and check the GitHub Actions tab.

4. Simulate a failing test to see the GitHub Actions in action.

5. Requesting a vulnerability workflow: `@workspace generate  a gh actions workflow to "Check for Dependency Vulnerabilities" using bundler-audit gem on every push`

6. Generating a threshold for simplecov: `@workspace Generate a GitHub Actions workflow for the SimpleCov, the workflow should include the step to get the code coverage reports, and enforce a minimum coverage threshold of 95%. The build should pass if the code coverage is greater than or equal to 95%. If the coverage falls below 95%, the workflow should fail.`
