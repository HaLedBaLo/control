function bb3d_G(ex, ey)
	return [0; 0; -g*lz*m_t*sin(ex)*cos(ey); -g*lz*m_t*sin(ey)*cos(ex); 0;;]
end