class Want < ActiveRecord::Base
  belongs_to :workshop
  validates :email, :presence => true, :email => true
  validates_uniqueness_of :email, :scope => :workshop_id, :message => "has already been registered for this workshop"
end
