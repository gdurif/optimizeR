## biglasso solver wrapper

# Main algorithm
biglasso_imp <- function(X, Y, lambda_min, n_iter) {
    require(biglasso)
    
    X_bm <- as.big.matrix(X)
    
    out <- biglasso(
        X_bm, Y, penalty="lasso", lambda.min = lambda_min, 
        family="gaussian", eps=1e-14, ncores=1, max.iter = n_iter
    )
    
    return(list(beta=as.matrix(out$beta[-1,])))
}