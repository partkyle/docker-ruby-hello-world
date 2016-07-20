require 'redis'
require 'sinatra'

set :bind, ENV['HOST'] || '0.0.0.0'
set :port, ENV['PORT'] || 80

key = ENV['COUNT_KEY'] || 'tmpkey'

redis = Redis.new

get '/' do
  redis.incr(key)

  "The current count is #{redis.get(key)}"
end
