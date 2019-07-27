clc
clear all
close all


num_bits = 4; %this will generate a 2x2 multiplier

% we will need to generate this many number of cases to satify all possible outcomes
total_num_cases = 2 ^ (num_bits + num_bits);
total_num_bits = num_bits + num_bits;

Aint = int16.empty(total_num_cases,0);
out = double.empty(size(Aint));

for i = 1:(total_num_cases)
   out = [out ; de2bi(i-1, total_num_bits)];
end
clear i;

A = out(:,1:num_bits);
B = out(:,num_bits+1:2*num_bits);
clear out;

out = double.empty(size(Aint));
for i = 1:(total_num_cases)
   out = [out; (bi2de(A(i,:)) * bi2de(B(i,:)))];
end

clear Aint i;
% Plot frequency distribution
%histogram(out)

result = de2bi(out);
clear out;

equations = strings([total_num_bits, 1]);
equations_online_cal = strings([total_num_bits, 1]);
equations_reduced = strings([total_num_bits, 1]);
for i = 1:total_num_bits
    str = "";
    for j = 1:total_num_cases
        if result(j,i) == 1
            str = str + "(";
            for k = 1:size(A,2)
                if (A(j,k) == 1)
                    str = str + "A[" + (k-1) + "] & ";
                else
                    str = str + "~(A[" + (k-1) + "]) & ";
                end
            end
            
            for k = 1:size(B,2)
                if (B(j,k) == 1)
                    str = str + "B[" + (k-1) + "] & ";
                else
                    str = str + "~(B[" + (k-1) + "]) & ";
                end
            end
            str = strip(str); str = strip(str,'right','&'); str = strip(str);% remove the extra "&" at the end
            str = str + ") | ";
            
        end
    end
    str = strip(str); str = strip(str,'right','|'); str = strip(str);% remove the extra "|" at the end
    equations(i) = str;
    
    %equations_online_cal(i) = strrep(str,'[','');
    %equations_online_cal(i) = strrep(equations_online_cal(i),']','');
    
end


equations

% syms A0 A1 A2 A3 A4 A5 A6 A7 A8 A9;
% syms B0 B1 B2 B3 B4 B5 B6 B7 B8 B9;
% for i = 1:size(equations,1)
%     equations_reduced(i) =  simplify(str2sym(equations_online_cal(i)));
%     equations_reduced(i) =  simplify(str2sym(equations_online_cal(i)));
% end

% for i = 1:size(equations_reduced,1)
%     equations_reduced(i) =  strrep(equations_reduced(i),'A0','A[0]');
%     equations_reduced(i) =  strrep(equations_reduced(i),'A1','A[1]');
%     equations_reduced(i) =  strrep(equations_reduced(i),'A2','A[2]');
%     equations_reduced(i) =  strrep(equations_reduced(i),'A3','A[3]');
%     equations_reduced(i) =  strrep(equations_reduced(i),'A4','A[4]');
%     equations_reduced(i) =  strrep(equations_reduced(i),'A5','A[5]');
%     equations_reduced(i) =  strrep(equations_reduced(i),'A6','A[6]');
%     equations_reduced(i) =  strrep(equations_reduced(i),'A7','A[7]');
%     
%     equations_reduced(i) =  strrep(equations_reduced(i),'B0','B[0]');
%     equations_reduced(i) =  strrep(equations_reduced(i),'B1','B[1]');
%     equations_reduced(i) =  strrep(equations_reduced(i),'B2','B[2]');
%     equations_reduced(i) =  strrep(equations_reduced(i),'B3','B[3]');
%     equations_reduced(i) =  strrep(equations_reduced(i),'B4','B[4]');
%     equations_reduced(i) =  strrep(equations_reduced(i),'B5','B[5]');
%     equations_reduced(i) =  strrep(equations_reduced(i),'B6','B[6]');
%     equations_reduced(i) =  strrep(equations_reduced(i),'B7','B[7]');
% end

%equations_reduced

for i = 1:size(equations_reduced,1)
    str = equations(i);
    str = strrep(str,'A[0]','a');
    str = strrep(str,'A[1]','b');
    str = strrep(str,'A[2]','c');
    str = strrep(str,'A[3]','d');
    str = strrep(str,'A[4]','e');
    str = strrep(str,'A[5]','f');
    str = strrep(str,'A[6]','g');
    str = strrep(str,'A[7]','h');
    
    str = strrep(str,'B[0]','i');
    str = strrep(str,'B[1]','j');
    str = strrep(str,'B[2]','k');
    str = strrep(str,'B[3]','l');
    str = strrep(str,'B[4]','m');
    str = strrep(str,'B[5]','n');
    str = strrep(str,'B[6]','o');
    
    str = strrep(str,'&','*');
    str = strrep(str,'|','+');
    
    equations_reduced(i) = str;
end

equations_reduced

equations_reduced(1) = "a * i";
equations_reduced(2) = "(a + b) * (a + i) * (b + j) * (i + j) * (~a + ~b + ~i + ~j)";
equations_reduced(3) = "(a + b + c) * (a + b + i) * (a + c + j) * (a + i + j) * (a + ~b + ~c + ~i + ~j) * (b + i + k) * (c + k + ~a + ~i) * (i + j + k) * (i + ~a + ~b + ~j + ~k) * (~a + ~c + ~i + ~k)";
equations_reduced(4) = "(a + b + c + d) * (a + b + c + i) * (a + b + d + j) * (a + b + i + j) * (a + b + ~c + ~d + ~i + ~j) * (a + c + i + k) * (a + d + k + ~b + ~i) * (a + i + j + k) * (a + i + ~b + ~c + ~j + ~k) * (a + ~b + ~d + ~i + ~k) * (b + c + d + l) * (b + c + ~a + ~d + ~i + ~l) * (b + d + j + ~c + ~i + ~k + ~l) * (b + d + k + ~a + ~c + ~j + ~l) * (b + i + j + l) * (b + j + l + ~a + ~c + ~d + ~k) * (b + k + l + ~c + ~d + ~i + ~j) * (c + d + j + ~a + ~b + ~k + ~l) * (c + d + k + ~b + ~i + ~j + ~l) * (c + i + l + ~a + ~j) * (c + j + l + ~b + ~d + ~i + ~k) * (c + k + l + ~a + ~b + ~d + ~j) * (d + j + k + l) * (d + l + ~a + ~b + ~c + ~i) * (d + l + ~a + ~i + ~j + ~k) * (i + j + k + l) * (i + j + ~a + ~b + ~k + ~l) * (i + ~a + ~c + ~j + ~l) * (j + k + ~a + ~d + ~i + ~l) * (~a + ~b + ~c + ~d + ~i + ~l) * (~a + ~d + ~i + ~j + ~k + ~l) * (~b + ~d + ~i + ~j + ~k + ~l)";
equations_reduced(5) = "(a + b + c + j) * (a + b + d + k) * (a + b + i + ~c + ~d + ~j + ~k) * (a + b + j + k) * (a + b + k + ~c + ~i) * (a + c + d + l) * (a + c + j + ~d + ~i + ~k + ~l) * (a + c + k + ~b + ~d + ~j + ~l) * (a + d + i + l + ~b + ~j) * (a + d + j + ~b + ~c + ~k + ~l) * (a + d + k + ~c + ~i + ~j + ~l) * (a + i + j + ~b + ~c + ~k + ~l) * (a + i + ~b + ~d + ~j + ~l) * (a + l + ~b + ~i + ~j + ~k) * (b + c + d) * (b + c + i + j) * (b + c + j + l) * (b + c + ~a + ~i + ~j + ~l) * (b + d + j + k) * (b + d + j + ~a + ~i + ~l) * (b + d + k + l) * (b + d + l + ~a + ~i + ~j) * (b + i + j + k) * (b + i + k + ~a + ~c + ~d + ~l) * (b + i + l + ~c + ~d + ~j + ~k) * (b + j + l + ~a + ~d + ~i) * (b + k + l + ~c + ~i) * (b + ~a + ~c + ~i + ~k + ~l) * (b + ~a + ~d + ~i + ~j + ~l) * (c + d + j + l) * (c + d + j + ~a + ~k) * (c + d + k + l) * (c + d + k + ~a + ~i + ~j) * (c + i + j + l) * (c + i + j + ~a + ~k) * (c + i + k + ~b + ~d + ~j + ~l) * (c + i + l + ~a + ~b + ~d + ~k) * (c + j + ~a + ~b + ~k + ~l) * (c + k + l + ~a + ~b + ~i) * (d + i + k + l) * (d + i + ~a + ~b + ~c + ~j) * (d + j + l + ~a + ~b + ~i) * (d + ~a + ~b + ~i + ~j + ~l) * (d + ~a + ~j + ~k + ~l) * (j + k + l) * (j + k + ~a + ~b + ~d + ~i) * (l + ~a + ~b + ~d + ~i + ~j) * (l + ~b + ~c + ~d + ~i) * (~a + ~b + ~c + ~d + ~i) * (~a + ~i + ~j + ~k + ~l)";
equations_reduced(6) = "(a + b + c + k) * (a + b + d + l) * (a + b + j + ~c + ~d + ~k + ~l) * (a + b + k + ~d + ~i + ~j + ~l) * (a + b + l + ~c + ~j + ~k) * (a + c + d) * (a + c + j + k) * (a + c + j + ~b + ~i + ~l) * (a + c + k + l) * (a + c + l + ~b + ~i + ~j) * (a + d + j + l) * (a + d + j + ~b + ~k) * (a + d + k + ~b + ~i + ~j) * (a + j + l + ~b + ~c + ~i) * (a + ~b + ~c + ~i + ~j + ~l) * (a + ~b + ~j + ~k + ~l) * (b + c + d) * (b + c + i + k) * (b + c + j + k) * (b + c + k + l) * (b + d + i + l) * (b + d + i + ~a + ~j + ~k) * (b + d + j + l) * (b + d + j + ~a + ~i + ~k) * (b + i + j + ~c + ~d + ~k + ~l) * (b + i + k + ~a + ~d + ~j) * (b + i + l + ~c + ~j) * (b + j + l + ~a + ~c + ~i) * (b + k + ~c + ~d + ~i + ~j + ~l) * (b + l + ~c + ~d + ~j + ~k) * (b + ~a + ~i + ~j + ~k + ~l) * (c + d + i + k) * (c + d + j + k) * (c + d + l) * (c + i + j + k) * (c + i + j + ~a + ~b + ~d + ~l) * (c + i + l + ~a + ~b + ~j) * (c + j + ~b + ~d + ~i + ~k + ~l) * (c + l + ~b + ~i + ~j + ~k) * (d + i + j + l) * (d + i + j + ~b + ~c + ~k) * (d + i + k + ~a + ~b + ~j) * (d + j + ~b + ~c + ~k + ~l) * (d + k + l) * (d + k + ~b + ~c + ~i + ~j) * (i + k + l) * (i + ~b + ~c + ~d + ~j) * (i + ~b + ~d + ~j + ~k + ~l) * (j + k + l) * (j + ~a + ~b + ~c + ~d + ~i)";
equations_reduced(7) = "(a + b + d) * (a + b + j + l) * (a + b + ~c + ~k + ~l) * (a + c + i + l) * (a + d + i + k) * (a + j + ~c + ~d + ~k + ~l) * (b + c + l) * (b + c + ~a + ~i + ~j + ~k) * (b + d + i + j) * (b + d + k) * (b + i + ~c + ~d + ~k + ~l) * (b + j + ~c + ~d + ~k + ~l) * (b + k + ~a + ~c + ~j) * (b + k + ~c + ~i + ~j) * (c + d) * (c + j + l) * (c + j + ~a + ~b + ~k) * (c + j + ~b + ~i + ~k) * (c + ~b + ~j + ~k + ~l) * (d + j + k) * (d + l) * (i + j + l) * (i + j + ~c + ~d + ~k) * (j + k + ~a + ~b + ~c + ~i) * (k + l) * (k + ~b + ~c + ~d + ~j)";
equations_reduced(8) = "(a + b + c) * (a + b + i + k) * (a + c + i + j) * (a + j + k) * (b + c + i) * (b + c + j) * (b + j + k) * (c + k) * (i + j + k) * d * l";

for i = 1:size(equations_reduced,1)
   str =  equations_reduced(i);
   
   str = strrep(str,'a','A[0]');
   str = strrep(str,'b','A[1]');
   str = strrep(str,'c','A[2]');
   str = strrep(str,'d','A[3]');
   str = strrep(str,'e','A[4]');
   str = strrep(str,'f','A[5]');
   str = strrep(str,'g','A[6]');
   str = strrep(str,'h','A[7]');
   
   str = strrep(str,'i','B[0]');
   str = strrep(str,'j','B[1]');
   str = strrep(str,'k','B[2]');
   str = strrep(str,'l','B[3]');
   str = strrep(str,'m','B[4]');
   str = strrep(str,'n','B[5]');
   str = strrep(str,'o','B[6]');
   str = strrep(str,'p','B[7]');
   
   str = strrep(str,'*','&');
   str = strrep(str,'+','|');
    
   equations_reduced(i) = str;
end

equations_reduced