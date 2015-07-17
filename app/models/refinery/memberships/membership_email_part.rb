module Refinery
  module Memberships
    class MembershipEmailPart < ActiveRecord::Base

      validates_uniqueness_of :title

      translates :body if respond_to?(:translates)

      class << self
        def [](title)
          r = where(title: title).first
          raise ActiveRecord::RecordNotFound.new(":title = #{title}") unless r
          r
        end
      end
    end
  end
end
