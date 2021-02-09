
# ==========================================
# K-NN algorithm using the generic syntax
# ==========================================
# 
# We define a dataset of N points in R^D, separated in two classes,
# and a dataset of query points, then apply a simple K-NN algorithm.

library(dplyr)
library(ggplot2)
library(class)
library(rkeops)

KNNExample = function(N, Ntest, D, K) {
    print(paste("k-NN with N=", N,", Ntest=", Ntest, ", D=", D, ", K=", K, sep=""))

    z = matrix(runif(Ntest*D), Ntest, D)
    x = matrix(runif(N*D), N, D)
    clx = matrix(sample(0:1, N, rep=TRUE), N, 1)
    
    formula = paste('ArgKMin_Reduction(SqDist(z,x),', K, ',0)', sep="")
    var1 = paste('z=Vi(', D, ')', sep="") # First arg   : i-variable, of size D
    var2 = paste('x=Vj(', D, ')', sep="") # First arg   : j-variable, of size D
    variables = c(var1, var2)
    
    set_rkeops_option("precision", "float")
    op_keops_float = keops_kernel(formula, variables)
    
    set_rkeops_option("precision", "double")
    op_keops_double = keops_kernel(formula, variables)
    
    op_nokeops = function(args) {
	    z = args[[1]]
	    x = args[[2]]
        Ntest = nrow(z)
        N = nrow(x)
        D = ncol(x)
        inds = matrix(0, Ntest, K)
        for(i in 1:Ntest)
            inds[i,] = order(rowSums((x - matrix(z[i,], N, D, byrow=TRUE))^2))[1:K]
        return(inds)
    }
    
    op_keops = op_keops_float
    start = Sys.time()
    inds = 1 + op_keops(list(z, x)) # indexes start at 0 in KeOps
    cl1 = round(rowMeans(matrix(clx[inds], Ntest, K)))
    end = Sys.time()
    time1 = as.numeric(end - start)
    
    op_keops = op_keops_double
    start = Sys.time()
    inds = 1 + op_keops(list(z, x)) # indexes start at 0 in KeOps
    cl2 = round(rowMeans(matrix(clx[inds], Ntest, K)))
    end = Sys.time()
    time2 = as.numeric(end - start)
    
    # compare with standard native R knn
    time3 = NA
    cl3 = NULL
    if(N<7000) {
        start = Sys.time()
        inds = as.integer(as.vector(op_nokeops(list(z, x))))
        cl3 = round(rowMeans(matrix(clx[inds], Ntest, K)))
        end = Sys.time()
        time3 = as.numeric(end - start)
    }
    
    # compare with `class` R package knn
    time4 = NA
    cl4 = NULL
    if(N<7000) {
        start = Sys.time()
        cl4 = as.numeric(as.character(knn(x, z, clx, k=K)))
        end = Sys.time()
        time4 = as.numeric(end - start)
    }
    
    print(paste("difference between rkeops double and float version: ",
                mean(cl1!=cl2), sep=""))
    
    if(!is.null(cl3)) {
        print(paste("difference between rkeops double and R version: ",
                    mean(cl2!=cl3), sep=""))
    }
    
    if(!is.null(cl4)) {
        print(paste("difference between rkeops double and class version: ",
                    mean(cl2!=cl4), sep=""))
    }
    
    if(!is.null(cl3) & !is.null(cl4)) {
        print(paste("difference between R version and class version: ",
                    mean(cl3!=cl4), sep=""))
    }
    
    out = data.frame(
        method = c("RKeOps float", "RKeOps double", "R", "R class"),
        time = c(time1, time2, time3, time4),
        dim = N,
        stringsAsFactors = FALSE
    )
    return(out)
}


dim_value = c(100,200,500,1000)#,2000,5000,10000) #,20000,50000,100000,200000,500000,1000000)
n_test = 10000
n_rep = 5

param_grid = expand.grid(dim = dim_value, rep = 1:n_rep, KEEP.OUT.ATTRS = FALSE)

experiment = Reduce(
    "bind_rows",
    lapply(
        split(param_grid, seq(nrow(param_grid))), 
        function(config) {
            return(KNNExample(N = config$dim, Ntest = n_test, D=100, K=10))
        }
    )
)

experiment_summary <- experiment %>% 
    group_by(method, dim) %>%
    dplyr::summarize(mean_time = mean(time, na.rm=TRUE))

ggplot(experiment, aes(x=dim, y=time, group=method, col=method)) +
    geom_smooth() +
    theme_bw()

ggplot(experiment_summary, aes(x=dim, y=mean_time, group=method, col=method)) +
    geom_point() +geom_line() +
    theme_bw()

