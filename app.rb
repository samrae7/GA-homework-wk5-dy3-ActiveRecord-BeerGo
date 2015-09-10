class Beergo < Sinatra::Base

  get '/' do
    erb :home
  end

  get '/about' do 
    erb :about
  end

#INDEX

  get '/beers' do

    @beers = Beer.all
    erb(:"beers/index")
  end

#NEW
  get '/beers/new' do
    @beer = Beer.new
    erb(:"beers/new")
  end

#CREATE
  post '/beers' do

    @beer = Beer.new(params[:beer])
    if @beer.save
      redirect("beers/#{@beer.id}") 
    else
      erb(:"beers/new")
    end
  end

#SHOW 

  get '/beers/:id' do
    @beer = Beer.find(params[:id])
    erb :beer
  end


#EDIT

  get '/beers/:id/edit' do
    @beer = Beer.find(params[:id])
    erb (:"beers/edit")
  end


#UPDATE
  post '/beers/:id' do

    @beer = Beer.find(params[:id])

    if @beer.update_attributes(params[:beer])
      redirect("/beers/#{@beer.id}")
    else
      erb (:"beers/edit")
    end
  end

#DELETE

  post '/beers/:id/delete' do
    @beer = Beer.find(params[:id])
    puts @beer

    # binding.pry

    if @beer.destroy
      redirect('/beers')
    else
      redirect("/beers/#{@beer.id}")
      # why not just use params[:id]??- seems to be interchangeable ( from checking wth pry)
    end
  end



end