module PgpoolNoLoadBalance
  module ActiveRecord
    module Relation
      def pgpool_nlb(value = true)
        spawn.pgpool_nlb!(value)
      end

      def pgpool_nlb!(value = true)
        self.pgpool_nlb_value = value
        self
      end

      def pgpool_nlb_value
        @values.fetch(:pgpool_nlb, nil)
      end

      def pgpool_nlb_value=(value)
        assert_mutability!
        @values[:pgpool_nlb] = value
      end

      private

      def build_arel(aliases)
        arel = super
        arel.pgpool_nlb(pgpool_nlb_value)
        arel
      end
    end
  end
end
