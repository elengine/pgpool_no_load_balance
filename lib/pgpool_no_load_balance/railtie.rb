module PgpoolNoLoadBalance
  class Railtie < ::Rails::Railtie

    initializer 'pgpool_nlb.initialize', after: 'active_record.initialize_database' do |app|
      ActiveSupport.on_load(:active_record) { PgpoolNoLoadBalance.setup! }
    end

  end
end
