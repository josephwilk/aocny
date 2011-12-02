class Workshop < ActiveRecord::Base
  has_many :wants

  def add_new_want(email)
    lead = Want.create(:workshop => self, :email => email)
    lead
  end
end
