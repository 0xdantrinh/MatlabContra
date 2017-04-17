function freefall(dt,tStop,c,k)
g=9.8

t=0:dt:tStop
jj=tStop/dt

a.free=@(v)g
a.linear=@(v)g-c*v
a.square=@(v)g-k*v^2
v.free=[0]
v.linear=[0]
v.square=[0]
for ii=1:jj
v.free(end+1)=integral(a.free,0,t(jj+1))
v.linear(end+1)=integral(a.linear,0,t(jj+1))
v.square(end+1)=integral(a.square,0,t(jj+1))
end

hold on
plot(t,v.free)
plot(t,v.linear)
plot(t,v.square)
