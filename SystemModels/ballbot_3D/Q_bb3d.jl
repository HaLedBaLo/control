function Q_bb3d(ex, ey, ez, r_b, r_w)
  x0 = sin(ey)
  x1 = 1/r_w
  x2 = sqrt(2)*x1
  x3 = x0*x2
  x4 = sin(ez)
  x5 = cos(ey)
  x6 = x2*x5
  x7 = x4*x6
  x8 = cos(ez)
  x9 = sqrt(6)*x1/4
  x10 = x5*x8*x9
  x11 = x3/2 - x7/4
  x12 = sin(ex)
  x13 = x12*x6
  x14 = cos(ex)
  x15 = x0*x12
  x16 = x2*(x14*x8 + x15*x4)
  x17 = x9*(-x14*x4 + x15*x8)
  x18 = -x13/2 - x16/4
  x19 = r_b*x9
  x20 = r_b*x2
  x21 = 0.5*x20
  x22 = x20/4
  x23 = x20/2
	return [0.5*x3 + 0.5*x7 -x10 + x11 x10 + x11; -0.5*x13 + 0.5*x16 -x17 + x18 x17 + x18; 0 x19 -x19; -x21 x22 x22; x21 x23 x23]
end