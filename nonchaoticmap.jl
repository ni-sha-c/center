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
	x2_gr = copy(x1_gr)
	for i = 1:10
		x2_gr = identity_pert.(x2_gr,s)
	end
	return x_gr, x1_gr, x2_gr
end
