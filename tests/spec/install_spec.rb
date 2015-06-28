require 'serverspec'

set :backend, :exec

describe package('zsh') do
  it { should be_installed }
end

describe command('ls /root/.zfunctions') do
  its(:stderr) { should match /No such file or directory/ }
end

describe file('/root/.zfunctions/async') do
  it { should_not be_file }
end

describe file('/root/.zfunctions/prompt_mlpure_setup') do
  it { should_not be_file }
end
