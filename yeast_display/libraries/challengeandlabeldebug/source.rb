# frozen_string_literal: true

needs 'Standard Libs/Debug'

module ChallengeAndLabelDebug
  require 'json'

  include Debug

  INPUT_YEAST = 'Yeast Culture'
  PROTEASE = 'Protease'

  OPTIONS = {
    od_ml_needed: 0.83,
    assay_microliters: 50,
    protease_dilution_factor: 1.0,
    protease_working_microliters: 50,
    protease_incubation_time_minutes: 40,
    n_protease_washes: 1,
    quench_protease: false
  }.freeze

  DEBUG_CONCENTRATIONS = {
    'Chymotrypsin' => { stock: 20_894 },
    'Trypsin' => { stock: 32_881 },
    'vegfr_biotinilated' => { stock: 3.6 }
  }.freeze

  # Helps create a realistic set of inputs for tests
  #
  # @note Overrides inputs for randomly-generated items
  def override_input_operations
    consolidate_yeast_inputs
    consolidate_protease_inputs

    associate_plan_options(OPTIONS)
  end

  def associate_plan_options(opts)
    plan = operations.first.plan
    plan.associate(:options, opts.to_json)
  end

  def consolidate_yeast_inputs
    grp = operations.group_by { |op| [op.input(INPUT_YEAST).sample, op.input(PROTEASE).sample] }
    consolidate_inputs(grp, INPUT_YEAST)
  end

  def consolidate_protease_inputs
    grp = operations.group_by { |op| op.input(PROTEASE).sample }
    consolidate_inputs(grp, PROTEASE)
    items = operations.map { |op| op.input(PROTEASE).item }.uniq
    items.each do |i|
      concentration = DEBUG_CONCENTRATIONS[i.sample.name][:stock]
      i.associate(:units_per_milliliter, concentration)
    end
  end

  def consolidate_inputs(grouped_ops, input_name)
    grouped_ops.each_value do |ops|
      child_item_id = ops.shift.input(input_name).child_item_id
      ops.each do |op|
        op.input(input_name).update_attributes(child_item_id: child_item_id)
      end
    end
  end
end
