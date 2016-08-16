

class SongsController < ApplicationController


#gets

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
   erb :'/songs/new'
 end

 get '/songs/:slug' do
   @song = Song.find_by_slug(params[:slug])


   if params[:message]
     @message = params[:message]
   end

   erb :'songs/show'
 end





#posts

 post '/songs' do
     @song = Song.create(:name => params["Name"])
     @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
     genre_name = params[:genre][":name"]

     if genre_name
       @song.genres << Genre.find_or_create_by(name: genre_name)
     end

     @song.genre_ids = params[:genres]
     @song.save
     @message = "Successfully created song."

     redirect("/songs/#{@song.slug}?message=#{@message}")

   end

   get '/songs/:slug/edit' do
     @song = Song.find_by_slug(params[:slug])
     erb :'songs/edit'
   end

   patch '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])
     @song.update(params[:song])
     @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
     @song.save
     @message = "Successfully updated song."
     redirect("/songs/#{@song.slug}?message=#{@message}")
   end




end
