require "pgpool_no_load_balance/active_record/querying"
require "pgpool_no_load_balance/active_record/relation/query_methods"
require "pgpool_no_load_balance/arel/select_manager"
require "pgpool_no_load_balance/active_record/connection_adapters/postgresql_adapter"
require "pgpool_no_load_balance/active_record/explain_subscriber"
require "pgpool_no_load_balance/railtie" if defined?(::Rails::Railtie)
require "pgpool_no_load_balance/version"

module PgpoolNoLoadBalance
  NLB_COMMENT = '/*NO LOAD BALANCE*/'

  def self.setup!
    ::ActiveRecord::Base.extend PgpoolNoLoadBalance::ActiveRecord::Querying
  ::ActiveRecord::Relation.prepend PgpoolNoLoadBalance::ActiveRecord::QueryMethods
    ::ActiveRecord::Relation::VALID_UNSCOPING_VALUES << :pgpool_nlb
    ::Arel::SelectManager.include PgpoolNoLoadBalance::Arel::SelectManager
    ::ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.prepend PgpoolNoLoadBalance::ActiveRecord::ConnectionAdapters::PostgreSQLAdapter
    ::ActiveRecord::ExplainSubscriber.prepend PgpoolNoLoadBalance::ActiveRecord::ExplainSubscriber
  end
end
