bits = [0 1 0 0 1 0];
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t));
lastbit = -1;
for i=1:length(bits)
  if bits(i)==1
    x((i-1)*n+1:i*n) = -lastbit;
    lastbit = -lastbit;
  end
end

plot(t, x, 'Linewidth', 3);
hold on;
plot(xlim, [0 0], '-r')
hold off;
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'off';
ax.GridAlpha = 0.5;
title('AMI');

counter = 0;
lastbit = -1;
for i = 1:length(t)
  if t(i)>counter
    counter = counter + 1;
    if x(i)==-lastbit
      result(counter) = 1;
      lastbit = -lastbit;
    else result(counter) = 0;
    end
  end
end
disp('AMI Decoding:');
disp(result);