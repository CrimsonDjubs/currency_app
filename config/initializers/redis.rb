# frozen_string_litera: true

Redis.current ||= Redis.new(url: ENV['REDIS_URL'], timeout: 10)
