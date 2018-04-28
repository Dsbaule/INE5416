Cv, Ce, Cs, Fv, Fe, Fs = map(int, raw_input().split())

Cp = Cv * 3 + Ce * 1
Fp = Fv * 3 + Fe * 1

if Cp > Fp:
    print ("C")
elif Fp > Cp:
    print ("F")
else:
    if Cs > Fs:
        print ("C")
    elif Fs > Cs:
        print ("F")
    else:
        print ("=")
