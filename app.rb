require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require 'sinatra/activerecord'
require './models'

enable :sessions

get '/' do
    @games = Game.all
  erb :index

end

get '/dailytop' do
    @posts = Post.all
  erb :dailytop

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

post '/gameadd' do
 Game.create({
   title: params[:title],
   description: params[:description],
   creator: params[:creator],
   date: params[:date],
   link: params[:link],
 })

 redirect '/'
end


get '/toukou' do
   @posts = Post.all
   @games = Game.all
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

post '/rpg/:id/delete' do
  post = Game.find(params[:id])
  post.destroy
  redirect '/toukou'
end

post '/rpg/:id/edit' do
  post = Game.find(params[:id])
  post.title = params[:title]
  post.creator = params[:creator]
  post.link = params[:link]
  post.description = params[:description]
  post.save
  redirect '/toukou'
end