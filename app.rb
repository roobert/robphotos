#!/usr/bin/env ruby

require 'sinatra'
require 'nokogiri'
require 'redcarpet'
require 'ostruct'

require 'haml'
require 'sass'

require 'ap'
require 'pp'
require 'yaml'

# this auto-reloads files with changed mtime
Sinatra::Application.reset!

set :haml, { :ugly=>true }

get '/css/:style.css' do
  scss :"#{params[:style]}"
end

get '/' do
  @images = YAML.load_file File.join(File.dirname(__FILE__), "public/images.yaml")
  haml :album
end
