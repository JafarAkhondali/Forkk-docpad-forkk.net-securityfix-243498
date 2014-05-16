# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
    templateData:
        site:
            title: "Forkk.net"
            subtitle: "Rants from a crazy programmer"
            description: "Rants from a crazy programmer"
            url: "http://forkk.net"
            author: "Forkk"

    outPath: "dist"

    collections:
        posts: ->
            @getCollection("documents").findAllLive({relativeOutDirPath:"posts"},[date:-1])
    
    plugins:
        rss:
            collection: "posts"
            url: "rss.xml"
}

# Export the DocPad Configuration
module.exports = docpadConfig

