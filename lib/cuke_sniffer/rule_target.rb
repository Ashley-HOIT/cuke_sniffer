require 'cuke_sniffer/constants'
require 'cuke_sniffer/rule_config'

module CukeSniffer

  # Author::    Robert Cochran  (mailto:cochrarj@miamioh.edu)
  # Copyright:: Copyright (C) 2013 Robert Cochran
  # License::   Distributes under the MIT License
  # Parent class for all objects that have rules executed against it
  # Mixins: CukeSniffer::Constants, CukeSniffer::RuleConfig, ROXML
  class RuleTarget
    include CukeSniffer::Constants
    include CukeSniffer::RuleConfig
    include ROXML

    xml_accessor :score, :location
    xml_accessor :rules_hash, :as => {:key => "phrase", :value => "score"}, :in => "rules", :from => "rule"

    # int: Sum of the rules fired
    attr_accessor :score

    # string: Location in which the object was found
    attr_accessor :location

    # hash: Contains the phrase every rule fired against the object and times it fired
    # * Key: string
    # * Value: int
    attr_accessor :rules_hash

    # Location must be in the format of "file_path\file_name.rb:line_number"
    def initialize(location)
      @location = location
      @score = 0
      @rules_hash = {}
      @class_type = self.class.to_s.gsub(/.*::/, "")
    end

    # Compares the score against the objects threshold
    # If a score is below the threshold it is good and returns true
    # Return: Boolean
    def good?
      score <= Constants::THRESHOLDS[@class_type]
    end

    # Calculates the score to threshold percentage of an object
    # Return: Float
    def problem_percentage
      score.to_f / Constants::THRESHOLDS[@class_type].to_f
    end

    def == (comparison_object) # :nodoc:
      comparison_object.location == location &&
      comparison_object.score == score &&
      comparison_object.rules_hash == rules_hash
    end


    #TODO Abstraction needed for this regex matcher (constants?)
    def is_comment?(line)
      true if line =~ /^\#.*$/
    end

    def store_rule(object, rule, phrase = rule.phrase)
      object.score += rule.score
      object.rules_hash[phrase] ||= 0
      object.rules_hash[phrase] += 1
    end
  end
end
