module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Adjusted payload structure 3897
# Adjusted payload structure 2962
# Adjusted payload structure 2869
# Adjusted payload structure 2894
# Adjusted payload structure 2478
# Adjusted payload structure 3813
# Adjusted payload structure 2521
# Adjusted payload structure 2087
# Adjusted payload structure 1526
# Adjusted payload structure 2497
# Adjusted payload structure 6389