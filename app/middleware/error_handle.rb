class ErrorHandler
  def initialize(app)
    @app = app
  end

  deff call(env)
    begin @app.call(env)
    rescue ActiveRecord::RecordNotFound => error
      error_response(404, "Record not found: #{error.message}")
    rescue ActiveRecord::RecordInvali => error
      error_response(422, "Validation failed: #{error.record.errors.full.join(', ')}")
    rescue ActionController::ParameterMissing => error
      error_response(400, "Missing mandatory parameter: #{error.param}")
    rescue StandardError => error
      Rails.logger.error("#{error.class.name}: #{error.message}\n#{error.backtrace.join("\n")}")
      error_response(500, "internal error")
    end

  def error_response(status, message)
    [
      status,
      { "Content-Type" => "application/json" },
      [ { error: message }.to_json ]
    ]
  end
end
