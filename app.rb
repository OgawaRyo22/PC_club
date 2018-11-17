require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require 'sinatra/activerecord'
require './models'

enable :sessions

get '/' do
  erb :index

end

get '/dailytop' do
    @posts = Post.all
  erb :dailytop

end

get '/loading' do
  erb :loading
end

post '/write' do
 Post.create({
   title: params[:title],
   content: params[:content],
   date: params[:date]
 })

 redirect '/dailytop'


end

get '/toukou' do
   @posts = Post.all
  erb :write
end

post '/vote/:id/delete' do
  post = Post.find(params[:id])
  post.destroy
  redirect '/toukou'
end

post '/vote/:id/edit' do
  post = Post.find(params[:id])
  post.title = params[:title]
  post.content = params[:content]
  post.save
  redirect '/toukou'
end