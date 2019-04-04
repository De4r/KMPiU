function p=pilo(t,T)

p=zeros(size(t));
k=length(p);

for i=1:k
    if i>1 && i<k
        p(i) = t(i);
    elseif i==floor(k) || i == 1
        p(i) = 0;
    end
end
