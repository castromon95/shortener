module ShortenerError
  class CustomError < StandardError
    attr_reader :message, :klass, :kind
    def initialize(message, klass, kind)
      @message = message
      @klass = klass
      @kind = kind
    end
  end
end