import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint, solve_ivp

l=0.5
pocz='gora'

def szlaban(x, t):
	k = 2000
	b = 20000
	e = 0.1
	m1 = 10
	m2 = 2
	g = 9.81
	dfi, fi = x

	M = np.zeros((2,2))
	M[0, 0] = 1/3*(m2*e**2 + 16*m1*l**2)
	M[1, 1] = 1

	Me = 300
	if pocz=='gora':
		if fi >=0 and fi < np.pi/2:
			Me = Me
		elif fi > np.pi/2:
			Me = -Me
	elif pocz=='dol':
		if fi<= np.pi/2 and fi > 0:
			Me = -Me
		elif fi < 0:
			Me = Me

	W = np.array([-k*(e**2)*np.sin(np.pi/4 - fi)*np.cos(np.pi/4 - fi) - b*(e**2)*dfi*(np.cos(np.pi/4 - fi))**2 + Me + m2*g*e/2*np.cos(np.pi/4 -fi) - m1*g*2*l*np.cos(fi), dfi])

	F = np.linalg.inv(M) @ W
	return F

def szlaban2(t, x):
	k = 2000
	b = 20000
	e = 0.1
	m1 = 10
	m2 = 2
	g = 9.81
	dfi, fi = x

	M = np.zeros((2,2))
	M[0, 0] = 1/3*(m2*e**2 + 16*m1*l**2)
	M[1, 1] = 1

	Me = 300
	if pocz=='gora':
		if fi >=0 and fi < np.pi/2:
			Me = Me
		elif fi > np.pi/2:
			Me = -Me
	elif pocz=='dol':
		if fi<= np.pi/2 and fi > 0:
			Me = -Me
		elif fi < 0:
			Me = Me

	W = np.array([-k*(e**2)*np.sin(np.pi/4 - fi)*np.cos(np.pi/4 - fi) - b*(e**2)*dfi*(np.cos(np.pi/4 - fi))**2 + Me + m2*g*e/2*np.cos(np.pi/4 -fi) - m1*g*2*l*np.cos(fi), dfi])

	F = np.linalg.inv(M) @ W
	return F

t0 = 0
tk = 3
N = 10001
t = np.linspace(t0, tk, N)

if pocz=='gora':
	y0 = [0, 0]
elif pocz=='dol':
	y0 = [0, np.pi/2]

y2 = solve_ivp(szlaban2, [t0, tk], y0, t_eval=t)
y = odeint(szlaban, y0, t)

a = np.gradient(y[:, 0])
yy = y*4*l
aa = np.gradient(yy[:, 0])

y = y*180/np.pi
a = a*180/np.pi

plt.figure(1)
plt.plot(t,y,t,a)
plt.legend(("Predkosc katowa", "Przemieszcenie katowe", "Przyspieszenie katowe"))
plt.grid()
plt.xlabel('Czas [s]')
plt.show()

plt.figure(2)
plt.plot(t,yy,t,aa)
plt.legend(("Predkosc", "Przemieszcenie", "Przyspieszenie"))
plt.grid()
plt.xlabel('Czas [s]')
plt.show()

a2 = np.gradient(y2.y.T[:, 0])
yy2 = y2.y.T*4*l
aa = np.gradient(y2.y.T[:, 0])

yy2 = yy2*180/np.pi
aa = aa*180/np.pi

plt.figure(3)
plt.plot(t, y2.y.T, t, a2)
plt.legend(("Predkosc katowa", "Przemieszcenie katowe", "Przyspieszenie katowe"))
plt.grid()
plt.xlabel('Czas [s]')
plt.show()

plt.figure(4)
plt.plot(t, yy2, t, aa)
plt.legend(("Predkosc", "Przemieszcenie", "Przyspieszenie"))
plt.grid()
plt.xlabel('Czas [s]')
plt.show()

