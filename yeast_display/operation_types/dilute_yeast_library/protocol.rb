# frozen_string_literal: true

needs 'Yeast Display/YeastDisplayHelper'

# Dilute Yeast Library Protocol
#
# @author Devin Strickland <strcklnd@uw.edu>
class Protocol
  include YeastDisplayHelper

  def main
    operations.retrieve.make

    group_ops_by_container.each do |container, container_group|
      prepare_media_and_dilute(container, container_group)
    end
    return_to_incubator

    mark_cultures_for_discard(operations.map { |op| op.input(INPUT_YEAST).item })

    operations.store
    transfer_bin_numbers(operations: operations)

    {}
  end
end
