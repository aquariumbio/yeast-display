# Innoculate Yeast Library

Documentation here. Start with a paragraph, not a heading or title, as in most views, the title will be supplied by the view.
### Inputs


- **Yeast Culture** [YL]  
  - <a href='#' onclick='easy_select("Sample Types", "Yeast Strain")'>Yeast Strain</a> / <a href='#' onclick='easy_select("Containers", "Yeast Plate")'>Yeast Plate</a>
  - <a href='#' onclick='easy_select("Sample Types", "DNA Library")'>DNA Library</a> / <a href='#' onclick='easy_select("Containers", "Yeast Library Glycerol Stock")'>Yeast Library Glycerol Stock</a>
  - <a href='#' onclick='easy_select("Sample Types", "DNA Library")'>DNA Library</a> / <a href='#' onclick='easy_select("Containers", "Labeled Yeast Library Suspension")'>Labeled Yeast Library Suspension</a>
  - <a href='#' onclick='easy_select("Sample Types", "Yeast Strain")'>Yeast Strain</a> / <a href='#' onclick='easy_select("Containers", "Divided Yeast Plate")'>Divided Yeast Plate</a>

- **Media** [M]  
  - <a href='#' onclick='easy_select("Sample Types", "Media")'>Media</a> / <a href='#' onclick='easy_select("Containers", "800 mL Liquid")'>800 mL Liquid</a>

### Parameters

- **Options** 

### Outputs


- **Yeast Culture** [YL]  
  - <a href='#' onclick='easy_select("Sample Types", "Yeast Strain")'>Yeast Strain</a> / <a href='#' onclick='easy_select("Containers", "Yeast 5ml culture")'>Yeast 5ml culture</a>
  - <a href='#' onclick='easy_select("Sample Types", "DNA Library")'>DNA Library</a> / <a href='#' onclick='easy_select("Containers", "Yeast Library Liquid Culture")'>Yeast Library Liquid Culture</a>

### Precondition <a href='#' id='precondition'>[hide]</a>
```ruby
require 'date'
require 'json'

def precondition(op)
    return true unless op.input('Options')
    
    opts = JSON.parse(op.input('Options').value, { symbolize_names: true })
    
    return true unless opts[:delay_until]
    
    if opts[:delay_until] =~ /\d{2}\/\d{2}\/\d{2}/
        frmt = "%m/%d/%y"
    elsif opts[:delay_until] =~ /\d{4}-\d{2}-\d{2}/
        frmt = "%Y-%m-%d"
    else
        return true
    end
    
    Time.now >= Time.strptime(opts[:delay_until], frmt)
end
```

### Protocol Code <a href='#' id='protocol'>[hide]</a>
```ruby
# Devin Strickland
# dvn.strcklnd@gmail.com

needs "Yeast Display/YeastDisplayShows"
needs "Yeast Display/YeastDisplayHelper"
needs "Standard Libs/SortHelper"

class Protocol

    include YeastDisplayShows, YeastDisplayHelper, SortHelper

    INPUT_YEAST = 'Yeast Culture'

    def main

        # DO NOT DELETE SORT BY ID
        ops_sorted=sortByMultipleIO(operations, ["in"], [INPUT_YEAST], ["id"], ["item"])
        operations=ops_sorted

        set_test_labels(operations.map { |op| op.input(INPUT_YEAST).item }) if debug

        group_ops_by_container.each do |container, container_group|
            container_group.retrieve.make
            prepare_media_and_dilute(container, container_group)
        end

        return_to_incubator

        input_items = operations.map { |op| op.input(INPUT_YEAST).item }

        discards = input_items.reject { |i| i.object_type.name =~ /(plate|glycerol)/i }

        mark_cultures_for_discard(discards)

        glycerol_stocks = input_items.select { |i| i.object_type.name =~ /(Yeast Library Glycerol Stock)/i }
        glycerol_stocks.map { |i| i.mark_as_deleted }

        show do
            title "Throw Away Glycerol Stocks"

            note "Throw away all the <b>empty</b> glycerol stocks (#{glycerol_stocks.map { |i| i.to_s }.to_sentence})."
        end

        operations.store

        # DO NOT DELETE
        operations.each { |op|
            if( !(op.input(INPUT_YEAST).item.get(:bin).nil?) ) # sorted sample
                op.output(OUTPUT_YEAST).item.associate(:bin, op.input(INPUT_YEAST).item.get(:bin))
            end
        }

        # library glycerol stocks need to be deleted
    end

end
```
