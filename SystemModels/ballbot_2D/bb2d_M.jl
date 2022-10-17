function bb2d_M(I_b, I_t, I_w, alpha, l, m_b, m_t, r_b, r_w)
  x0 = r_b^2
  x1 = I_w / r_w^2
  x2 = cos(alpha)
  x3 = -l * m_t * x2 - r_b * x1
  x4 = l^2 * m_t
  return [I_b/x0+m_b+m_t+x1 x3; x3 I_t+x0*x1+x2^2*x4+x4*sin(alpha)^2]
end