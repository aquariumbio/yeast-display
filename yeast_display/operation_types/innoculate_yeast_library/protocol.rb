# frozen_string_literal: true

needs 'Yeast Display/YeastDisplayShows'
needs 'Yeast Display/YeastDisplayHelper'

# Inoculate Yeast Library Protocol
#
# @author Devin Strickland <strcklnd@uw.edu>
class Protocol
  include YeastDisplayHelper
  include YeastDisplayShows

  INPUT_YEAST = 'Yeast Culture'

  def main
    set_test_labels(operations.map { |op| op.input(INPUT_YEAST).item }) if debug

    operations.retrieve.make

    group_ops_by_container.each do |container, container_group|
      prepare_media_and_dilute(container, container_group)
    end
    return_to_incubator

    operations.each { |op| op.input(INPUT_YEAST).item.mark_as_deleted }
    discard_deleted_inputs(operations: operations)

    operations.store
    transfer_bin_numbers(operations: operations)

    {}
  end
end
