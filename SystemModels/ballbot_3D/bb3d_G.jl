function bb3d_G(ex, ey, g, lz, m_t)
  x0 = g*lz*m_t
	return [0; 0; -x0*sin(ex)*cos(ey); -x0*sin(ey)*cos(ex); 0;;]
end