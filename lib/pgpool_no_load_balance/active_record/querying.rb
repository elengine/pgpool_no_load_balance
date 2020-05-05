require "active_support"

module PgpoolNoLoadBalance
  module ActiveRecord
    module Querying
      delegate :pgpool_nlb, to: :all
    end
  end
end
