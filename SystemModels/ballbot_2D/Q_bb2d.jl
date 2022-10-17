function Q_bb2d(r_b, r_w)
  x0 = 1 / r_w
  return [-x0; r_b * x0]
end