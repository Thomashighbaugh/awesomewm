local cpu = {}

function cpu.read()
  local file = io.open('/proc/stat', 'r')
  local line = file:read()
  output = {}
  while line do
    local index, user, nice, system, idle, iowait, irq, softirq, steal, guest, guest_nice = line:match('^cpu(%d*)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)$')
    if index then
      if index == '' then
        index = 'total'
      else
        index = tonumber(index) + 1
      end
      output[index] = {
        user = tonumber(user),
        nice = tonumber(nice),
        system = tonumber(system),
        idle = tonumber(idle),
        iowait = tonumber(iowait),
        irq = tonumber(irq),
        softirq = tonumber(softirq),
        steal = tonumber(steal),
        guest = tonumber(guest),
        guest_nice = tonumber(guest_nice),
      }
      local total = 0
      for key, value in pairs(output[index]) do
        total = total + value
      end
      output[index].total = total
    end
    line = file:read()
  end
  file:close()
  return output
end

local lastread = nil

function cpu.percents()
  local output = {}
  read = cpu.read()
  for index, table in pairs(read) do
    output[index] = {}
    local total = table.total
    local last_table
    local last_total
    if lastread then
      last_table = lastread[index]
      last_total = last_table.total
    end

    for key, value in pairs(table) do
      if key ~= 'total' then
        if last_table then
          if total > last_total then
            output[index][key] = (value - last_table[key]) / (total - last_total)
          else
            output[index][key] = 0
          end
        else
          output[index][key] = 0
        end
      end
    end
  end
  lastread = read
  return output
end

-- Take in an array table and return a table with the ipairs flattened and each
-- value given a max, min, and average
-- If values is not set, it takes the current percentages
function cpu.stats(values)
  if not values then
    values = cpu.percents()
  end

  local output = {}
  for index, table in ipairs(values) do
    for key, value in pairs(table) do
      if not output[key] then
        output[key] = {
          max = value,
          min = value,
          sum = 0,
          average = 0,
        }
      end
      output[key].sum = output[key].sum + value
      output[key].average = output[key].average + value / #values

      if value > output[key].max then
        output[key].max = value
      end
      if value < output[key].min then
        output[key].min = value
      end
    end
  end
  return output
end

return cpu
