# InSpec test for recipe nginx::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/


describe service "nginx" do
  it {should be_enabled}
  it {should be_running}
end
# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end
