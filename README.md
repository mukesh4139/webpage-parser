== README

# Web Page Parser

This is a ruby on rails application that parse the webpage and stores the content
of h1, h2, h3 tags and link of a tags.

## Dependencies
            * Ruby Version    : 2.3.1
            * Rails           : 5.1.7
            * JsonApi Resources
            * Nokogiri
            
## Installation
            $ git clone https://github.com/mukesh4139/webpage-parser.git
            $ bundle install
            $ rake db:create
            $ rake db:migrate
            $ rails server
            

## APIs

#### Create New Page
    curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"page", "attributes":{"url":"https://www.facebook.com"}}}' http://localhost:3000/pages
    
#### Fetch the parsed URLs along with tags
    curl -i -H "Accept: application/vnd.api+json" "http://localhost:3000/pages?include=tags"    
