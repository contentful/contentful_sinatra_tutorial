require 'sinatra/base'
require 'contentful'

class ContentfulDemoApp < Sinatra::Application
  set :views, settings.root + '/templates'

  get '/' do
    slim :index
  end

  get '/space/:space/token/:token/content_type/:content_type' do
    slim(
      :products,
      locals: {
        products: contentful(
          params[:space],
          params[:token]
        ).entries(
          content_type: params[:content_type],
          include: 2
        )
      }
    )
  end

  private

  def contentful(space, access_token)
    @client ||= Contentful::Client.new(
      space: space,
      access_token: access_token,
      dynamic_entries: :auto,
      raise_errors: true
    )
  end
end
