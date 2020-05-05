module PgpoolNoLoadBalance
  module ActiveRecord
    module ExplainSubscriber
      def ignore_payload?(payload)
        payload_for_check = payload.dup
        payload_for_check[:sql] = payload_for_check[:sql].sub(NLB_COMMENT, '')
        super payload_for_check
      end
    end
  end
end
