require 'spec_helper'

describe package('apt-transport-https') do
  it { should be_installed }
end

describe command('apt-cache policy') do
  jitsi_apt_repo = <<APT_REPO
 500 https://download.jitsi.org/ stable/ Packages
     release o=jitsi.org,a=stable,n=stable,l=Jitsi Debian packages repository,c=
     origin download.jitsi.org
APT_REPO
  its('stdout') { should include(jitsi_apt_repo) }
end

describe file('/etc/apt/sources.list.d/jitsi_meet.list') do
  it { should exist }
  its('mode') { should eq '644' }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
