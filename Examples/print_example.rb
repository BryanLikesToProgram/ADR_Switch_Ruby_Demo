#=====================#
#   Scrolling print   #  
#     Bryan Racic     #
#=====================#
=begin
  This is a quick script I've been using to explore objects 
=end     

### Global Vars ###
$firstrun = true
$start_tick = $dragon.root.tick_count

def tick args
    ## Initialization ##
    if $firstrun
        $firstrun = false
        $printvar = args.to_s # convert object to string
    end
    printvar = print(args, $printvar)
end

### Display passed printable as label, scroll if necessary ###
def print tickObj, printvar
    if printvar.length <= 1265 # printable larger than screen size
        tickObj.labels << [0, 725, printvar]
    else
        tickObj.labels << [0, 725, printvar]
        if $dragon.root.tick_count >= $start_tick + 10 # only update every 10 ticks
            ## Move the first char to the end of the string ##
            temp = printvar[0]
            printvar[0] = ''
            $start_tick = $dragon.root.tick_count
            return
        end
    end
end