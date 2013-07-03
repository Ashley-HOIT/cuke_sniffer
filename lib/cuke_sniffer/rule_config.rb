module CukeSniffer

  # Contains the rules and various scores used in evaluating objects
  module RuleConfig

    # Will prevent suite from executing properly
    FATAL = 100

    # Will cause problem with debugging
    ERROR = 25

    # Readability/misuse of cucumber
    WARNING = 10

    # Small improvements that can be made
    INFO = 1

    fatal_rules = {
        :no_examples => {
            :enabled => true,
            :phrase => "Scenario Outline with no examples.",
            :score => FATAL
        },
        :no_examples_table => {
            :enabled => true,
            :phrase => "Scenario Outline with no examples table.",
            :score => FATAL
        },
        :recursive_nested_step => {
            :enabled => true,
            :phrase => "Recursive nested step call.",
            :score => FATAL
        },
        :background_with_tag => {
            :enabled => true,
            :phrase => "There is a background with a tag. This feature file cannot run!",
            :score => FATAL
        },
        :comment_after_tag => {
            :enabled => true,
            :phrase => "Comment comes between tag and properly executing line. This feature file cannot run!",
            :score => FATAL
        }
    }

    error_rules = {
        :no_description => {
            :enabled => true,
            :phrase => "{class} has no description.",
            :score => ERROR
        },
        :no_scenarios => {
            :enabled => true,
            :phrase => "Feature with no scenarios.",
            :score => ERROR
        },
        :commented_step => {
            :enabled => true,
            :phrase => "Commented step.",
            :score => ERROR
        },
        :commented_example => {
            :enabled => true,
            :phrase => "Commented example.",
            :score => ERROR
        },
        :no_steps => {
            :enabled => true,
            :phrase => "No steps in Scenario.",
            :score => ERROR
        },
        :one_word_step => {
            :enabled => true,
            :phrase => "Step that is only one word long.",
            :score => ERROR
        },
        :no_code => {
            :enabled => true,
            :phrase => "No code in Step Definition.",
            :score => ERROR
        },
        :around_hook_without_2_parameters => {
            :enabled => true,
            :phrase => "Around hook without 2 parameters for Scenario and Block.",
            :score => ERROR
        },
        :around_hook_no_block_call => {
            :enabled => true,
            :phrase => "Around hook does not call its block.",
            :score => ERROR
        },
        :hook_no_debugging => {
            :enabled => true,
            :phrase => "Hook without a begin/rescue. Reduced visibility when debugging.",
            :score => ERROR
        },
        :hook_conflicting_tags => {
            :enabled => true,
            :phrase => "Hook that both expects and ignores the same tag. This hook will not function as expected.",
            :score => ERROR
        },
    }

    warning_rules = {
        :numbers_in_description => {
            :enabled => true,
            :phrase => "{class} has numbers in the description.",
            :score => WARNING
        },
        :empty_feature => {
            :enabled => true,
            :phrase => "Feature file has no content.",
            :score => WARNING
        },
        :background_with_no_scenarios => {
            :enabled => true,
            :phrase => "Feature has a background with no scenarios.",
            :score => WARNING
        },
        :background_with_one_scenario => {
            :enabled => true,
            :phrase => "Feature has a background with one scenario.",
            :score => WARNING
        },
        :too_many_steps => {
            :enabled => true,
            :phrase => "{class} with too many steps.",
            :score => WARNING,
            :condition => 7
        },
        :out_of_order_steps => {
            :enabled => true,
            :phrase => "Scenario steps out of Given/When/Then order.",
            :score => WARNING
        },
        :invalid_first_step => {
            :enabled => true,
            :phrase => "Invalid first step. Began with And/But.",
            :score => WARNING
        },
        :asterisk_step => {
            :enabled => true,
            :phrase => "Step includes a * instead of Given/When/Then/And/But.",
            :score => WARNING
        },
        :one_example => {
            :enabled => true,
            :phrase => "Scenario Outline with only one example.",
            :score => WARNING
        },
        :too_many_examples => {
            :enabled => true,
            :phrase => "Scenario Outline with too many examples.",
            :score => WARNING,
            :condition => 10
        },
        :multiple_given_when_then => {
            :enabled => true,
            :phrase => "Given/When/Then used multiple times in the same {class}.",
            :score => WARNING
        },
        :too_many_parameters => {
            :enabled => true,
            :phrase => "Too many parameters in Step Definition.",
            :score => WARNING,
            :condition => 4
        },
        :lazy_debugging => {
            :enabled => true,
            :phrase => "Lazy Debugging through puts, p, or print",
            :score => WARNING
        },
        :pending => {
            :enabled => true,
            :phrase => "Pending step definition. Implement or remove.",
            :score => WARNING
        },
        :feature_same_tag => {
            :enabled => true,
            :phrase => "Same tag appears on Feature.",
            :score => WARNING
        },
        :scenario_same_tag => {
            :enabled => true,
            :phrase => "Tag appears on all scenarios.",
            :score => WARNING
        },
        :commas_in_description => {
            :enabled => true,
            :phrase => "There are commas in the description, creating possible multirunning scenarios or features.",
            :score => WARNING
        },
        :commented_tag => {
            :enabled => true,
            :phrase => "{class} has a commented out tag",
            :score => WARNING
        },
        :empty_hook => {
            :enabled => true,
            :phrase => "Hook with no content.",
            :score => WARNING
        },
        :hook_all_comments => {
            :enabled => true,
            :phrase => "Hook is only comments.",
            :score => WARNING
        },
        :hook_duplicate_tags => {
            :enabled => true,
            :phrase => "Hook has duplicate tags.",
            :score => WARNING
        }
    }

    info_rules = {
        :too_many_tags => {
            :enabled => true,
            :phrase => "{class} has too many tags.",
            :score => INFO,
            :condition => 8
        },
        :long_name => {
            :enabled => true,
            :phrase => "{class} has a long description.",
            :score => INFO,
            :condition => 180
        },
        :implementation_word => {
            :enabled => true,
            :phrase => "Implementation word used: {word}.",
            :score => INFO,
            :condition => ["page", "site", "url", "button", "drop down", "dropdown", "select list", "click", "text box", "radio button", "check box", "xml", "window", "pop up", "pop-up", "screen"]
        },
        :too_many_scenarios => {
            :enabled => true,
            :phrase => "Feature with too many scenarios.",
            :score => INFO,
            :condition => 10
        },
        :date_used => {
            :enabled => true,
            :phrase => "Date used.",
            :score => INFO
        },
        :nested_step => {
            :enabled => true,
            :phrase => "Nested step call.",
            :score => INFO
        },
        :commented_code => {
            :enabled => true,
            :phrase => "Commented code in Step Definition.",
            :score => INFO
        },
        :small_sleep => {
            :enabled => true,
            :phrase => "Small sleeps used. Use a wait_until like method.",
            :score => INFO,
            :condition => 2
        },
        :large_sleep => {
            :enabled => true,
            :phrase => "Large sleeps used. Use a wait_until like method.",
            :score => INFO,
            :condition => 2
        },
        :todo => {
            :enabled => true,
            :phrase => "Todo found. Resolve it.",
            :score => INFO
        },
        :hook_not_in_hooks_file => {
            :enabled => true,
            :phrase => "Hook found outside of the designated hooks file",
            :score => INFO,
            :condition => "hooks.rb"
        },
    }

    # Master hash used for rule data
    # * +:enabled+
    # * +:phrase+
    # * +:score+
    # Optional:
    # * +:words+
    # * +:max+
    # * +:min+
    RULES = {}.merge fatal_rules.merge error_rules.merge warning_rules.merge info_rules
  end
end
