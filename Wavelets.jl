
function basicSignal(linSpace, frequency, amplitude)
    return amplitude*sin.(frequency .*2 .*pi .* linSpace)
end


function HermitianHat(linSpace, dilat, posic)
    t = ((linSpace .- posic) ./ dilat)
    return 2 / (5 ^ (1 / 2)) * pi ^-(1/4) .* t .*(1 .+ t) .*ℯ .^((-1/2) .*t .^ 2)
end

function MexicanHat(linSpace, dilat, posic)
    t = ((linSpace .- posic) ./ dilat)
    return (1 .- t .^ 2) .* ℯ .^ ((t .^ 2 ./ 2) .* -1)
end

function MeyerWavelet(linSpace, dilat, posic)
    t = ((linSpace .- posic) ./ dilat)
    return [i .== 0 ? 
            2/3 + 4/(3*pi) : 
            ((sin((2*pi)/(3) * i)+(4/3)*i*cos(((4*pi)/3)*i))/(pi*i-(16*pi/9)*(i^3)))
            for i = t]
end

function HermitianWavelet(linSpace, dilat, posic)
    t = ((linSpace .- posic) ./ dilat)
    return (2^(1/2))*pi^(-1/4) .* t .* ℯ .^((-t .^2)./ 2)
end

function MorletWavelet(linSpace, dilat, posic)
    t = ((linSpace .- posic) ./ dilat)
    return ℯ .^ ((-t .^ 2) ./ 2) .* ℯ .^ (1im .* 6 .* t)
end
            