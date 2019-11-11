json.success @result[:success]
json.user do
  json.entries @result[:entity] do |reducer|
    json.extract! reducer, :url, :count, :title
    json.short_url reducer.reduced_url
  end
end