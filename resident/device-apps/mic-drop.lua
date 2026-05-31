local smooth = 0

function on_tick(ctx, dt_ms)
  local level = mic.level()
  smooth = smooth * 0.7 + level * 0.3
  local bar_h = floor(smooth * 135)
  local r, g, b
  if smooth < 0.6 then
    r, g, b = 0, 220, 60
  elseif smooth < 0.85 then
    r, g, b = 255, 200, 0
  else
    r, g, b = 255, 40, 0
  end
  screen.clear()
  if bar_h > 0 then
    screen.fill_rect(0, 135 - bar_h, 240, bar_h, r, g, b)
  end
  screen.flip()
end
