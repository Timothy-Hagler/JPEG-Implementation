function X = dctbasis(img)

N = 8; 
% N is the size of the NxN block being DCTed.
% For this code, it does a 4x4, 8x8, and 16x16
% Create C
G = zeros(N,N);
F = zeros(N,N);
for m = 0:1:N-1
	for n = 0:1:N-1
		if n == 0
		k = sqrt(1/N);
		else
		k = sqrt(2/N);
		end
        C(m+1,n+1) = k*cos( ((2*m+1)*n*pi) / (2*N));
	end
end

for m = 0:1:N-1
	for n = 0:1:N-1
		if n == 0
		k = sqrt(1/N);
		else
		k = sqrt(2/N);
		end
	F(m+1,n+1) = k*cos( ((2*m+1)*n*pi) / (2*N));
	end
end

% Get Basis Functions
%figure;
colormap('gray');
for m = 0:1:N-1
	for n = 0:1:N-1
			%subplot(N,N,m*N+n+1);
			Y = img(m+1,n+1,1);
			X = C'*Y*C;
                 

			%imagesc(X);
			%axis square;
			%axis off;
	end
end

% for u = 0:1:N-1
% 	for v = 0:1:N-1
% 			%subplot(N,N,m*N+n+1);
% 			Y = [zeros(m,N);
% 			zeros(1,n) 1 zeros(1,N-n-1);
% 			zeros(N-m-1,N)];
% 			X(m,n) = C'*Y*C;
% 			%imagesc(X);
% 			%axis square;
% 			%axis off;
% 	end
% end

end

