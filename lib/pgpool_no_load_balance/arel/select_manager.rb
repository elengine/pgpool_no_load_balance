module PgpoolNoLoadBalance
  module Arel
    module SelectManager
      def pgpool_nlb(value = true)
        @pgpool_nlb_flag = !!value
        self
      end

      def pgpool_nlb?
        @pgpool_nlb_flag
      end
    end
  end
end
