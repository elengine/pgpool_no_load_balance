module PgpoolNoLoadBalance
  module ActiveRecord
    module ConnectionAdapters
      module PostgreSQLAdapter
        def execute(sql, name = nil, pgpool_nlb: false)
          sql = "#{NLB_COMMENT} #{sql}" if !!pgpool_nlb
          super sql, name
        end

        private

        def to_sql_and_binds(arel_or_sql_string, binds=[])
          sql, binds = super
          if arel_or_sql_string.respond_to?(:pgpool_nlb?) && arel_or_sql_string.pgpool_nlb?
            sql = "#{NLB_COMMENT} #{sql}"
          end
          [sql.freeze, binds]
        end
      end
    end
  end
end
