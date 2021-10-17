using Plots


function TransWaleContGraph(matrix, wavelet)
    heatmap(matrix, yflip = true,  c = :thermal)
    savefig(pwd() * "/" * string(nameof(wavelet)) * ".png")
end



function ContinuosTransWaleContGraph(linSpace, dilatRange, realSignal, Wavelet, amplitude, fileName = "Wavelet")
    fps = 30
    seconds = 15
    l = @layout [ a ; c ]
    matrix = zeros(Float64, size(linSpace,1), size(dilatRange,1))
    index = [(i, j) for j in 1:size(dilatRange,1) for i in 1:size(linSpace,1)]
    setLimits = [trapz(linSpace,Wavelet(linSpace, i, j) .* realSignal) * (1/(i^(1/2)))
                    for j in linSpace for i in dilatRange ]
    mini = minimum(setLimits)
    maxi = maximum(setLimits)
    frames = [div(x*size(index,1),fps*seconds) for x in 1:fps*seconds]
    indexFrame = index[frames]
    anim = @animate for tup in index
                            i = tup[1]
                            j = tup[2]
                            matrix[i,j] = trapz(linSpace, Wavelet(linSpace, dilatRange[j], linSpace[i]) .* realSignal) * (1/(dilatRange[j]^(1/2)))
                            if (i,j) ∉ indexFrame
                                continue
                            end
                            transpose
                            heatmap(transpose(matrix), c = :thermal, clim = (mini, maxi), yflip = true)
                    end
    gif(anim, fileName * string(nameof(Wavelet)) * "HeatMap.gif", fps = fps)
    anim = @animate for tup in indexFrame
                            if tup ∉ indexFrame
                                continue
                            end
                            i = tup[1]
                            j = tup[2]
                            plot(time, [Wavelet(linSpace, dilatRange[j], linSpace[i]).*(amplitude), realSignal])
                    end
    gif(anim, fileName * string(nameof(Wavelet)) * "Lines.gif", fps = fps)
end