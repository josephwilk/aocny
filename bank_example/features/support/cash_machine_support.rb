class Account
  def initialize(balance)
    @balance = balance
  end
  
  def withdraw(cash_amount)
    @balance = @balance - cash_amount
  end
  
  def balance
    @balance
  end
end

module DSL
  module CashMachine
    class FakeCashMachineAutomator
      def set_balance(cash_amount)
        @account = Account.new(cash_amount)
      end
      
      def withdraw(cash_amount)
        @account.withdraw(cash_amount)
      end
      
      def balance
        @account.balance
      end
    end
    
    class CashMachineAutomator
      include Capybara::DSL
      
      def initialize(app)
        @app = app
      end
      
      def set_balance(cash_amount)
        @account = Account.new(cash_amount)
      end
      
      def withdraw(cash_amount)
        visit "/withdraw"
        fill_in :amount, :with => cash_amount
        click 'Withdraw'
      end
      
      def balance
        page.should have_text(@account.balance)
      end
    end

    def cash_machine
      if ENV['FULL_STACK']
        @cash_machine ||= CashMachineAutomator.new(nil)
      else
        @cash_machine ||= FakeCashMachineAutomator.new
      end
    end
  end
end

World(DSL::CashMachine)