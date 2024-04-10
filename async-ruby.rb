require 'rest-client'
require "async"

start = Time.now

url = 'https://reqres.in/api/users/2'
response1 = RestClient.get(url, headers={})


all_users_url = 'https://reqres.in/api/users'
response2 = RestClient.get(all_users_url, headers={})

all_unkown_url = 'https://reqres.in/api/unknown'
response3 = RestClient.get(all_unkown_url, headers={})

puts "Sync Duration: #{Time.now - start}s"

# Test with async ruby
start = Time.now
Async do |task|

  task.async do
    url = 'https://reqres.in/api/users/2'
    response1 = RestClient.get(url, headers={})
  end

  task.async do
    all_users_url = 'https://reqres.in/api/users'
    response2 = RestClient.get(all_users_url, headers={})
  end

end

puts "Async Duration: #{Time.now - start}s"


# Output:
# Sync Duration: 0.413332s
# Async Duration: 0.080385s