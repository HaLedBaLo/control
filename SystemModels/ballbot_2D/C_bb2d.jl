function C_bb2d(alpha, dalpha, l, m_t)
	return [0 dalpha*l*m_t*sin(alpha); 0 0]
end