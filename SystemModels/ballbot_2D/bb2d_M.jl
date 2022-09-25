function bb2d_M(alpha)
	return [I_b/r_b^2 + I_w/r_w^2 + m_b + m_t -I_w*r_b/r_w^2 - l*m_t*cos(alpha); -I_w*r_b/r_w^2 - l*m_t*cos(alpha) I_t + I_w*r_b^2/r_w^2 + l^2*m_t*sin(alpha)^2 + l^2*m_t*cos(alpha)^2]
end