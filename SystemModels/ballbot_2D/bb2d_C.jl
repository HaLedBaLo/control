function bb2d_C(alpha, dalpha, l, m_t)
	return [0 dalpha*l*m_t*sin(alpha); 0 0]
end