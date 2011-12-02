require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'sinatra'

Capybara.app = Sinatra::Application

get '/' do
  %{
    <html>
      <body>
        <form action="/withdraw" method="post">
          <label for="amount">Amount</label>
          <input type="text" name="amount" id="amount">
          <input type="submit" value="Withdraw">
        </form>
      </body>
    </html>
  }
end

post '/withdraw' do
  amount = params[:amount].to_i
  account = settings.account
  account = account.withdraw(amount)
  status 200
  account.balance.to_s
end