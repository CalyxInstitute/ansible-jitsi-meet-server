require 'spec_helper'

describe package('jitsi-meet') do
  it { should be_installed }
end
