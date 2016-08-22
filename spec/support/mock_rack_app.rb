# frozen_string_literal: true
# Mocking an rack app
class MockRackApp
  def call(env)
    [200, { 'Content-Type' => 'text/plain' }, [env['rack.input'].read]]
  end
end
