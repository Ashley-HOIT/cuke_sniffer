FILE_IGNORE_LIST = %w(. ..)
DATE_REGEX = /(?<date>\d{2}\/\d{2}\/\d{4})/

FEATURE_NAME_REGEX = /Feature:\s*(?<name>.*)/
TAG_REGEX = /(?<tag>@\S*)/
SCENARIO_TITLE_STYLES = /(?<type>Scenario|Scenario Outline|Scenario Template):\s*/
SCENARIO_TITLE_REGEX = /#{SCENARIO_TITLE_STYLES}(?<name>.*)/

STEP_STYLES = /(?<style>Given|When|Then|And|Or|But|\*)\s/
STEP_REGEX = /^[#]?#{STEP_STYLES}(?<step_string>.*)/
STEP_DEFINITION_REGEX = /^#{STEP_STYLES}\/(?<step>.+)\/\sdo\s?(\|(?<parameters>.*)\|)?$/

SIMPLE_NESTED_STEP_REGEX = /^steps\s"#{STEP_STYLES}(?<step_string>.*)"/
SAME_LINE_COMPLEX_STEP_REGEX = /^steps\s%{#{STEP_STYLES}(?<step_string>.*)}/
START_COMPLEX_STEP_REGEX = /^steps\s%{\s*$/
END_COMPLEX_STEP_REGEX = /^}$/
START_COMPLEX_WITH_STEP_REGEX = /^steps\s%{#{STEP_STYLES}(?<step_string>.*)/
END_COMPLEX_WITH_STEP_REGEX = /^#{STEP_STYLES}(?<step_string>.*)}$/