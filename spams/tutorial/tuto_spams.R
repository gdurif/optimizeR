## Matrix factorization

# image
library(jpeg)
img = readJPEG(file.path("spams", "tutorial", "data", "image.jpg")) # edit path
str(img)

# channel extraction
img <- img[,,1]
str(img)

# image orientation and visualization
rotate <- function(x) t(apply(x, 2, rev))
img = rotate(img)
image(img)

# sparse NMF in SPAMS
library(spams)
res <- spams.nmf(img, return_lasso = TRUE, K = 5, numThreads = 4, iter = -5)
str(res)
U = as.matrix(res[[1]])
V = as.matrix(res[[2]])

# compare X size and sizes of U and V
prod(dim(img))
prod(dim(U)) + prod(dim(V))

# image recontruction
img_rec <- U %*% V
image(img_rec)

# image reconstruction for different values of K
par(mfrow=c(2,2))

K_val = c(5, 10, 20, 50)
res <- Reduce("rbind", lapply(
    K_val,
    function(K) {
        res <- spams.nmf(img, return_lasso = TRUE, K = K, numThreads = 4, iter = -5)
        U = as.matrix(res[[1]])
        V = as.matrix(res[[2]])
        
        # compare X size and sizes of U and V
        print(paste0("K = ", K))
        print(paste0("initial image memory footprint = ", prod(dim(img))))
        print(paste0(
            "reconstructed image memory footprint = ", prod(dim(U)) + prod(dim(V))
        ))
        print(paste0("ratio = ", (prod(dim(U)) + prod(dim(V)))/prod(dim(img))))
        
        # image recontruction
        img_rec <- U %*% V
        image(img_rec)
        
        # output
        out = data.frame(
            K = K,
            init_mem_fp = prod(dim(img)),
            rec_mem_fp = prod(dim(U)) + prod(dim(V)),
            ratio = (prod(dim(U)) + prod(dim(V)))/prod(dim(img)),
            rec_mem_fp_sparse = sum(U>0) + sum(V>0),
            ratio_sparse = (sum(U>0) + sum(V>0))/prod(dim(img))
        )
    }
))

# init_mem_fp = image initial memory footprint
# rec_mem_fp = reconstructed image memory footprint
# ratio = rec_mem_fp/init_mem_fp
# rec_mem_fp_sparse = reconstructed image memory footprint when accounting for factor sparsity
# ratio_sparse = rec_mem_fp_sparse/init_mem_fp
res
