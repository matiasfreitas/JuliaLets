using Trapz

function TransWaleConti(linSpace, dilatRange, realSignal, Wavelet)
    return reshape([trapz(linSpace,Wavelet(linSpace, i, j) .* realSignal) * (1/(dilatRange[j]^(1/2))) 
                                for j in linSpace for i in dilatRange ],
                                (size(linSpace,1), size(dilatRange,1)))
end