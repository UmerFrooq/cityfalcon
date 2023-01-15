# frozen_string_literal: true

class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end

  def response(data, status: :ok)
    ApiResponse.new(data: data, status: status)
  end
end
