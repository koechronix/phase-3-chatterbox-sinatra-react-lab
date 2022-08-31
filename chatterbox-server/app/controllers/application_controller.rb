class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # GET request
  get '/messages' do
    message = Message.all.order(:created_at)
    message.to_json
  end

  # POST request
  post '/messages' do
    message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    message.to_json
  end

  # PATCH request
  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json
  end

  # DELETE request
  delete '/messages/:id' do
    message = Message.find(params[:id])
    message.destroy

    message.to_json
  end
  
end
