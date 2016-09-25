class DocsController < ApplicationController
  include JsonapiSwaggerHelpers::DocsControllerMixin

  swagger_root do
    key :swagger, '2.0'
  end

  unless Rails.env.production?
    jsonapi_resource '/api/tweets', tags: ['tweets']
    jsonapi_resource '/api/users',
      tags: ['users'],
      only: [:index, :show]
    jsonapi_resource '/api/messages',
      tags: ['messages'],
      only: [:index, :show]
  end
end
