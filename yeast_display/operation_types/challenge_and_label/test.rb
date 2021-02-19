# frozen_string_literal: true

class ProtocolTest < ProtocolTestBase
  def setup
    libraries = [
      Sample.find_by_name('AMA1-best'),
      Sample.find_by_name('NODS4')
    ]
    proteases = [
      Sample.find_by_name('vegfr_biotinilated')
    ]
    concentrations = [0.1, 1, 2.5]
    antibody = Sample.find_by_name('Anti-c-myc-FITC')

    libraries.each do |library|
      proteases.each do |protease|
        concentrations.each do |concentration|
          add_operation
            .with_input('Yeast Culture', library)
            .with_input('Protease', protease)
            .with_input('Antibody', antibody)
            .with_output('Labeled Yeast Library', library)
            .with_property('Protease Concentration', concentration)
        end
      end
    end
  end

  def analyze
    log('Hello from Nemo')
    assert_equal(@backtrace.last[:operation], 'complete')
  end
end
