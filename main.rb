require __dir__ + '/bundle/bundler/setup.rb'

require 'lifx-lan'

def main(params={})
  discover
end

def discover
  lifx = LIFX::LAN::Client.lan
  data_formater(lifx.discover!)
end

private

def data_formater(discover)
  lifx = discover
  lights = lifx.lights

  lights_output = []
  lights.each do |light|
    lights_output << {
      name: light.label,
      id:   light.id,
    }
  end

  { lights: lights_output }
end
