function p=troj(t,T)

p=zeros(size(t));
k=length(p);

for i=1:k
    if i>=1 && i<=floor(k/2)+1
        p(i) = -t(i);
    elseif i>floor(k/2)+1 && i<=k
        p(i) = t(i);
    end
end
