# frozen_string_literal: true
require 'redis'

describe RackHealthCheck::Strategy::RedisChecker do
  let(:redis_instance) { double }
  before { allow(Redis).to receive(:new).and_return(redis_instance) }
  context 'with a succesfull response from ping' do
    before do
      allow(redis_instance).to receive(:ping).and_return('PONG')
    end

    it { expect { described_class.health_check }.to_not raise_error }
  end

  context 'without a succesfull response from ping' do
    before do
      allow(redis_instance).to receive(:ping).and_return('Some error')
    end

    it { expect { described_class.health_check }.to raise_error('Redis error: Some error') }
  end
end
