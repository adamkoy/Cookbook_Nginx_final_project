require 'chefspec'
require 'chefspec/policyfile'

#when you run your specs, ChefSpec will print a resource coverage summary
at_exit { ChefSpec::Coverage.report! }
