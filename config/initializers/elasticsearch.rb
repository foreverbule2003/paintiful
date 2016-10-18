host = ENV['SEARCHLY_URL']
Searchkick.client = Elasticsearch::Client.new(hosts: [host], 
                                              retry_on_failure: true)
