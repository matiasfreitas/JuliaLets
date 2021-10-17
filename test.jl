using Plots
using BenchmarkTools
include("Wavelets.jl")
include("SignalsAnalyses.jl")
include("ChartsWavelet.jl")



time = LinRange(0.001, 3, 1000)
dilatRange = LinRange(0.05, 1, 20)
freq = 1
amplitude = 20
realSignal = basicSignal(time, freq, amplitude)
#Try it with HermitianHat
plot(time, realSignal)
ContinuosTransWaleContGraph(time, dilatRange, realSignal, MeyerWavelet, amplitude)
matrix =TransWaleConti(time, dilatRange, realSignal, HermitianHat)
index = [(i, j) for j in 1:20 for i in 1:20 ]
index

