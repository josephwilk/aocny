require 'capybara/dsl'
require 'rspec/core'
require 'capybara/rspec/matchers'

module DSL::Want
  class WantBase 
    def previous_wants_email
      lead = Want.last
      raise Exception.new("No Wants!") unless lead
      lead.email
    end
  end
  
  class WantAutomator < WantBase
    include Capybara::RSpecMatchers
    include Capybara::DSL

    def initialize
    end

    def submit_a_want(params={})
      workshop = workshop_under_discussion(params[:name])
      visit "/workshops/#{workshop.id}"

      fill_in 'email-input', :with => params[:email] || Factory.next(:email_address)
      click_button 'want'
    end

    def should_be_tracking_the_workshop
      page.should have_content "Thanks"
    end

    def has_error?(message)
      page.should have_content message
    end

  end

  class FakeWantAutomator < WantBase
    def initalize
    end

    def submit_a_want(params={})
      workshop = workshop_under_discussion(params[:name])
      email = params[:email] || Factory.next(:email_address)
      @lead = workshop.add_new_want(email)
    end

    def should_be_tracking_the_workshop
      workshop_under_discussion.wants.count.should == 1
    end

    def has_error?(message)
      @lead.valid?.should == false
      @lead.errors.full_messages[0] =~ /#{message}/
    end

  end
  
  def want_automator
    if ENV['FULL_STACK']
      @want_automator ||= WantAutomator.new
    else
      @want_automator ||= FakeWantAutomator.new
    end
  end
end

World(DSL::Want)

