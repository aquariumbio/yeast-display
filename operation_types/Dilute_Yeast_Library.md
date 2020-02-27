# Dilute Yeast Library

Documentation here. Start with a paragraph, not a heading or title, as in most views, the title will be supplied by the view.
### Inputs


- **Yeast Culture** [YL]  
  - <a href='#' onclick='easy_select("Sample Types", "Yeast Strain")'>Yeast Strain</a> / <a href='#' onclick='easy_select("Containers", "Yeast 5ml culture")'>Yeast 5ml culture</a>
  - <a href='#' onclick='easy_select("Sample Types", "DNA Library")'>DNA Library</a> / <a href='#' onclick='easy_select("Containers", "Yeast Library Liquid Culture")'>Yeast Library Liquid Culture</a>
  - <a href='#' onclick='easy_select("Sample Types", "Yeast Strain")'>Yeast Strain</a> / <a href='#' onclick='easy_select("Containers", "Yeast 50ml culture")'>Yeast 50ml culture</a>

- **Media** [M]  
  - <a href='#' onclick='easy_select("Sample Types", "Media")'>Media</a> / <a href='#' onclick='easy_select("Containers", "800 mL Liquid")'>800 mL Liquid</a>



### Outputs


- **Yeast Culture** [YL]  
  - <a href='#' onclick='easy_select("Sample Types", "Yeast Strain")'>Yeast Strain</a> / <a href='#' onclick='easy_select("Containers", "Yeast 50ml culture")'>Yeast 50ml culture</a>
  - <a href='#' onclick='easy_select("Sample Types", "DNA Library")'>DNA Library</a> / <a href='#' onclick='easy_select("Containers", "Yeast Library Liquid Culture")'>Yeast Library Liquid Culture</a>

### Precondition <a href='#' id='precondition'>[hide]</a>
```ruby
def precondition(_op)
  true
end
```

### Protocol Code <a href='#' id='protocol'>[hide]</a>
```ruby
# Devin Strickland
# dvn.strcklnd@gmail.com

needs "Yeast Display/YeastDisplayShows"
needs "Yeast Display/YeastDisplayHelper"
needs "Standard Libs/Debug"
needs "Standard Libs/SortHelper"

class Protocol

    include YeastDisplayShows, YeastDisplayHelper, Debug, SortHelper

    def main
        
        # DO NOT DELETE 
        ops_sorted=sortByMultipleIO(operations, ["in"], [INPUT_YEAST], ["id"], ["item"])
        operations=ops_sorted
        
        operations.retrieve
        
        group_ops_by_container.each do |container, container_group|
            container_group.make
            prepare_media_and_dilute(container, container_group)
        end
        
        return_to_incubator
        
        mark_cultures_for_discard(operations.map { |op| op.input(INPUT_YEAST).item })
        
        operations.store
        
        # DO NOT DELETE 
        operations.each { |op|
            if( !(op.input(INPUT_YEAST).item.get(:bin).nil?) ) # sorted sample
                op.output(OUTPUT_YEAST).item.associate(:bin, op.input(INPUT_YEAST).item.get(:bin))
            end
        }
        operations.store
        
    end

end

```
