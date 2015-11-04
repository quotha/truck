require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'

require 'truck'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
