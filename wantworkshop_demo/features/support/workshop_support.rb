module DSL::Workshop
  class WorkshopAutomator
    include Capybara::DSL

    def initialize
    end
  end

  def workshop_automator
    @workshop_automator ||= WorkshopAutomator.new
  end
  
end

World(DSL::Workshop)