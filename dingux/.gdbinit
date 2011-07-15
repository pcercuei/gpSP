file gpsp.dge
target remote 10.1.0.2:1234
handle SIG32 noprint
disp/i $pc
b main
c

