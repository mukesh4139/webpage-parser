== README

# Web Page Parser

This is a ruby on rails application that parse the webpage and stores the content
of h1, h2, h3 tags and link of a tags.

## Dependencies
            * Ruby Version    : 2.3.1
            * Rails           : 5.1.7
            * JsonApi Resources
            * Nokogiri
            * RSpec
            
## Installation
            $ git clone https://github.com/mukesh4139/webpage-parser.git
            $ bundle install
            $ rake db:create
            $ rake db:migrate
            $ rails server
           
## Tests
            $ rspec            

## APIs

#### Create New Page
    curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"pages", "attributes":{"url":"https://www.facebook.com"}}}' http://localhost:3000/pages
    
#### Fetch the content of all parsed URLs along with tags
    curl -i -H "Accept: application/vnd.api+json" "http://localhost:3000/pages?include=tags"    

#### Fetch the content of a parsed URL
    curl -G -H "Accept: application/vnd.api+json" "http://localhost:3000/pages?include=tags" --data-urlencode "filter[url]=https://www.google.com"
