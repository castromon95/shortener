module ShortenerError
  class ValidationError < CustomError
    def initialize(msg, klass)
      super(msg, klass, :validation)
    end
  end
end