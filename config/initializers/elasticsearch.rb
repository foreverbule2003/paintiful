host = "https://site:e9804923b9ebaa1097d37b98141f4813@dori-us-east-1.searchly.com"
Searchkick.client = Elasticsearch::Client.new(hosts: [host], retry_on_failure: true)