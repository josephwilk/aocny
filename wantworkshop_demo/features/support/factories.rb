require 'factory_girl'

module WantWorkshop
  module Factories
    class << self
      def init
        init_sequences
        init_definitions
      end

      def init_sequences
        Factory.sequence :email_address do |n|
          "test-user-#{n}@wantworkshop.com"
        end
      end

      def init_definitions
        Factory.define :want do |want|
          want.email { Factory.next(:email_address) }
          want.association :workshop
        end

        Factory.define :workshop do |workshop|
          workshop.name 'Test workshop'
        end

      end
    end
  end
end
