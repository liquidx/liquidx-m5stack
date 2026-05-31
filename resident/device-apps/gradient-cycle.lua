local cols = 16
local rows = 9
local cw = 15
local ch = 15

local schemes = {
  {{255,0,0},   {255,255,0}},   -- red → yellow
  {{0,0,255},   {128,0,255}},   -- blue → purple
  {{0,255,255}, {255,0,255}},   -- cyan → magenta
  {{0,180,0},   {0,255,180}},   -- green → teal
  {{255,80,0},  {255,0,120}},   -- orange → pink
}

local scheme_idx = 1

local function tri(t)
  t = fract(t) * 2
  if t > 1 then t = 2 - t end
  return t
end

function on_tick(ctx, dt_ms)
  local base = ctx.time_ms / 10000
  local c1 = schemes[scheme_idx][1]
  local c2 = schemes[scheme_idx][2]
  screen.clear()
  for row = 0, rows - 1 do
    for col = 0, cols - 1 do
      local diag = (col / cols + row / rows) * 0.5
      local t = tri(diag + base)
      local r = floor(c1[1] + (c2[1] - c1[1]) * t)
      local g = floor(c1[2] + (c2[2] - c1[2]) * t)
      local b = floor(c1[3] + (c2[3] - c1[3]) * t)
      screen.fill_rect(col * cw, row * ch, cw, ch, r, g, b)
    end
  end
  screen.flip()
end

function on_event(ctx, e)
  if e.name == "button" and e.index == 0 then
    scheme_idx = (scheme_idx % #schemes) + 1
  end
end
