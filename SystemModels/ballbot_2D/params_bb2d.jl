# general 
g = 9.81    # [m/s^2]

# ball 
r_b = 0.1                                   # [m]
m_b = 0.8                                   # [kg]
I_b = m_b / 2 * (r_b^2 + (r_b - 0.01)^2)    # [kg m^2]

# torso 
l = 0.25                              # [m]
m_t = 4                                 # [kg] 
r_t = 0.12                              # [m]            
I_t = m_t * (1/4 * r_t^2 + 1/6 * l^2) # [kg*m^2]

# wheel
r_w = 0.05              # [m]
m_w = 0.25              # [kg]
I_w = 1/2 * m_w * r_w^2 # [kg*m^2]
