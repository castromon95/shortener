class ApplicationService
  def self.execute(*args, &block)
    new(*args, &block).execute
  end

  def format_result(entity, msg = nil, success = true)
    result = {}
    result[:entity] = entity
    result[:message] = msg
    result[:success] = success
    result[:type] = success ? 'success' : 'warning'
    result
  end

end