#!/bin/bash
rails generate controller CustomPrescription retrieve
exit

Usage:
  rails generate controller NAME [action action] [options]

Options:
  -e, [--template-engine=NAME]  # Template engine to be invoked
                                # Default: erb
      [--helper]                # Indicates when to generate helper
                                # Default: true
  -t, [--test-framework=NAME]   # Test framework to be invoked
                                # Default: test_unit

Runtime options:
  -s, [--skip]     # Skip files that already exist
  -p, [--pretend]  # Run but do not make any changes
  -q, [--quiet]    # Supress status output
  -f, [--force]    # Overwrite files that already exist

Description:
    Stubs out a new controller and its views. Pass the controller name, either
    CamelCased or under_scored, and a list of views as arguments.

    To create a controller within a module, specify the controller name as a
    path like 'parent_module/controller_name'.

    This generates a controller class in app/controllers and invokes helper,
    template engine and test framework generators.

Example:
    `rails generate controller CreditCard open debit credit close`

    Credit card controller with URLs like /credit_card/debit.
        Controller:      app/controllers/credit_card_controller.rb
        Functional Test: test/functional/credit_card_controller_test.rb
        Views:           app/views/credit_card/debit.html.erb [...]
        Helper:          app/helpers/credit_card_helper.rb
