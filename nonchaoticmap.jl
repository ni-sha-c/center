using PyPlot
function identity_pert(x, s)
		return (x + s*(2 + sin(2π*x))) % 1
end
function run(f, x₀, s, n)
	orbit = zeros(n)
	orbit[1] = x₀
	for i = 1:n-1
			orbit[i+1] = f(orbit[i], s)
	end
	return orbit
end
function spinup(f, x₀, s, n)
	x = x₀
	for i = 1:n
		x = f(x,s)
	end
	return x
end
function density_evolution(s)
	n_gr = 10000000
	x_gr = rand(n_gr)
	x1_gr = identity_pert.(x_gr,s)
	return x_gr, x1_gr
end
function plot_density_after_one_step(s)
	x, y = density_evolution(s)
	fig = figure()
	ax = fig.add_subplot()
	ax.hist(y, density=true, bins=25)
	n_gr = 200
	x_gr = LinRange(0.,1-1e-2,n_gr)
	x1_gr = identity_pert.(x_gr, s)
	dip(x) = 1.0 + s*cos(2π*x)*2π
	ax.plot(x1_gr, 1.0./abs.(dip.(x_gr)),"o") 	
end
