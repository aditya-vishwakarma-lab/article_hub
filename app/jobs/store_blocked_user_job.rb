class StoreBlockedUserJob < ApplicationJob
  queue_as :default

  def perform(blocked_status, user_email)
    # Do something later
    require "redis"

    redis = Redis.new

    if blocked_status == true
      redis.sadd('blocked_user', user_email)
    elsif blocked_status == false
      redis.srem('blocked_user', user_email)
    end
  end
end
