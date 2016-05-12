require 'spec_helper_acceptance'

describe 'nodejs class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work with no errors based on the example' do
      pp = <<-EOS
        include nodejs
      EOS

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe command('node -v') do
      its(:exit_status) { is_expected.to eq 0 }
      its(:stdout) { is_expected.to match /^v4.4.2$/ }   
    end

    describe command('npm -v') do
      its(:exit_status) { is_expected.to eq 0 }
      its(:stdout) { is_expected.to match /^2.15.0$/ }
    end
  end
end
