function metric = AWN(A,B)
    A_norm = A./sum(A);
    B_norm = B./sum(B);
    a = 0.5;
    metric = a*mean(abs(A_norm-B_norm))+(1-a)*max(abs(A_norm-B_norm)); 
end
