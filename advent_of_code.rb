#!/usr/bin/env ruby

Dir["./lib/*.rb"].each do |path|
  require path
  classname = File.basename(path, ".rb").capitalize
  klass = Object.const_get(classname)
  puts classname
  klass.run()
end
