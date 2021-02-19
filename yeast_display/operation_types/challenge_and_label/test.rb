# frozen_string_literal: true

class ProtocolTest < ProtocolTestBase
  def setup
    library = Sample.find_by_name('AMA1-best')
    add_operation
      .with_input('Yeast Culture', library)
      .with_input('Protease', Sample.find_by_name('vegfr_biotinilated'))
      .with_input('Antibody', Sample.find_by_name('Anti-c-myc-FITC'))
      .with_output('Labeled Yeast Library', library)
      .with_property('Protease Concentration', 1)
  end

  def analyze
    log('Hello from Nemo')
    assert_equal(@backtrace.last[:operation], 'complete')
  end
end
