needs 'Standard Libs/CommonInputOutputNames'

module YeastDisplayShows
  include CommonInputOutputNames

  def prepare_media(container_group, language)
    media_volume = language[:media_volume]
    output_items = container_group.map { |op| op.output(OUTPUT_YEAST).item }
    flasks = language[:flask_type].pluralize(output_items.length)

    show do
      title 'Prepare media'

      warning 'Work in the media bay for media preparation.'

      note "Add #{media_volume} of the following media into the #{flasks}."
      table media_table(container_group)
    end
  end

  def innoculate_flasks(container_group, language)
    n_flasks = container_group.length
    input_type = container_group.first.input(INPUT_YEAST).name
    language = language.merge({ input_type: input_type })

    show do
      title "Inoculate #{input_type.pluralize(n_flasks)}"

      note language[:passage_amount] % language
      table transfer_table(container_group)
    end
  end

  def media_table(container_group)
    this_table = container_group.start_table
    this_table = this_table.custom_column(heading: 'Media') { |op| op.input('Media').sample.name }

    if container_group.all? { |op| media_volume(op) }
      this_table = this_table.custom_column(heading: 'Volume (ml)') { |op| media_volume(op).round }
    end

    this_table.output_item(OUTPUT_YEAST, checkable: true).end_table
  end

  def transfer_table(container_group)
    this_table = container_group.start_table.input_item(INPUT_YEAST)

    if container_group.any? { |op| sample_tube_label(op.input(INPUT_YEAST).item) }
      this_table = this_table.custom_column(heading: 'Tube label') do |op|
        sample_tube_label(op.input(INPUT_YEAST).item)
      end
    end

    if container_group.all? { |op| transfer_volume(op) }
      this_table = this_table.custom_column(heading: 'Volume (ml)') { |op| transfer_volume(op).round(1) }
    end

    this_table.output_item(OUTPUT_YEAST, checkable: true).end_table
  end

  def measure_culture_ods(ops)
    show do
      title 'Measure library culture densities.'

      note 'Use the Nanodrop to measure the density of each yeast culture, and record the OD600.'
      warning 'Record the OD600 exactly as it is shown on the screen.'

      table ops.start_table
               .input_item(INPUT_YEAST)
               .get(:od, type: 'number', heading: 'OD600')
               .end_table
    end
  end
end
