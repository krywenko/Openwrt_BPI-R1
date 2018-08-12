module("luci.statistics.rrdtool.definitions.exec", package.seeall)

function rrdargs(graph, plugin, plugin_instance)
    -- For $HOSTNAME/exec-foo-bar/temperature_baz-quux.rrd, plugin will be
    -- "exec" and plugin_instance will be "foo-bar".  I guess graph will be
    -- "baz-quux"?  We may also be ignoring a fourth argument, dtype.
if "Energy" == plugin_instance then

        --
        -- Energy diagram
        --
 local energy = {

                -- draw this diagram for each plugin instance
               per_instance = true,
                title = "%H: Energy Production and Consumption--%di",
                vlabel = "watts",
number_format = "%6.2lf%%",
                -- diagram data description
                data = {
                        -- defined sources for data types, if ommitted assume a single DS named "value" (optional)
                        sources = {
                                power = { "value"}
                        },

                        -- special options for single data lines
                        options = {

                                --  power_wind_value = {
                                --  title = "wind power",
                                --  color = "00e000" -- green
                               
                                                               
                               power__value = {
                                              total = true,           -- report total amount
                                            --   color = "0000ff",       -- rx is blue
                                            --   noarea = true,
                                                overlay = true,
                                                title = "%di"
--transform_rpn = "3600,/"
                               }
                        }
                }
        }



local comp ={
                title = "%H: Compare",
                y_min = "0",
                alt_autoscale_max = true,
                vlabel = "watts",
               -- number_format = "%5.1lf%%",
                data = {
                        instances = {
                                power = { "grid", "wind" }
                        },

                        options = {
                                power_grid_value      = { noarea = true, overlay = true, total = true,  color = "ff0000", title = "Grid" },
                                power_wind_value      = { noarea = true, overlay = true, color = "00e000", title = "wind" }
                        }
              }
}



 return { energy, comp }

end

if "Temp" == plugin_instance then

 --
        -- Temperature diagram
        --
        local temp = {

                -- draw this diagram for each plugin instance
          --      per_instance = true,
                title = "%H: Temperature %di",
                vlabel = "celsius",

                -- diagram data description
                data = {
                        -- defined sources for data types, if ommitted assume a single DS named "value" (optional)
                        sources = {
                                temperature = { "value" }
                        },

                        -- special options for single data lines
                        options = {
                                power__value = {
                                --        total = true,           -- report total amount
                               --         color = "0000ff",       -- rx is blue
                                       noarea = true,
                                       overlay = true,
                                       title = "%di"
                                 --    title = "Energy Production"
                                }
                        }
                }
        }



 return { temp }


end
  -- flow added--                              
 if "Flow" == plugin_instance then

 --
        -- Temperature diagram
        --
        local flow = {

                -- draw this diagram for each plugin instance
          --      per_instance = true,
                title = "%H: Flow %di",
                vlabel = "litre",

                -- diagram data description
                data = {
                        -- defined sources for data types, if ommitted assume a single DS named "value" (optional)
                        sources = {
                                flow = { "value" }
                        },

                        -- special options for single data lines
                        options = {
                                power__value = {
                                --        total = true,           -- report total amount
                               --         color = "0000ff",       -- rx is blue
                                       noarea = true,
                                       overlay = true,
                                       title = "%di"
                                 --    title = "Energy Production"
                                }
                        }
                }
        }



 return { flow }


end                               
                                
                                

if "mqtt" == plugin_instance then
 --
        -- Temperature diagram
        --
        local mqtt = {

                -- draw this diagram for each plugin instance
                per_instance = true,
                title = "%H: mqtt %di",
                vlabel = "celsius",

                -- diagram data description
                data = {
                        -- defined sources for data types, if ommitted assume a single DS named "value" (optional)
                        sources = {
                                gauge = { "value" }
                        },

                        -- special options for single data lines
                        options = {
                                gauge__value = {
                                --        total = true,           -- report total amount
                                        color = "ff00ff",
area =  "00ff00",       -- rx is blue
                                      -- noarea = true,
                                       overlay = true,
                                       title = "%di"
                                 --    title = "Energy Production"
                                }
                        }
                }
        }

local comp1 ={
                title = "%H: Compare",
                y_min = "0",
                alt_autoscale_max = true,
                vlabel = "watts",
               -- number_format = "%5.1lf%%",
                data = {
                        instances = {
                                gauge = { "utility", "kitchen", "dinningroom" }
                        },

                        options = {
                                gauge_dinningroom_value      = { noarea = true, overlay = true, total = true,  color = "ff0000", title = "Grid" },
                                gauge_kitchen_value      = { noarea = true, overlay = true, color = "00e000", title = "wind" }
                        }
              }
}


 return { mqtt, comp1 }


end

end
