json.partial! 'api/v1/partials/info', result: @result
json.user do
  json.shortened_url @result[:entity].reduced_url
  json.original_url @result[:entity].url
end