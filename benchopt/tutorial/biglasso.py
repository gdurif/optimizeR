import numpy as np
from pathlib import Path

from benchopt import BaseSolver
from benchopt import safe_import_context


with safe_import_context() as import_ctx:

    from rpy2 import robjects
    from rpy2.robjects import numpy2ri
    from benchopt.helpers.r_lang import import_func_from_r_file

    # Setup the system to allow rpy2 running
    R_FILE = str(Path(__file__).with_suffix('.R'))
    import_func_from_r_file(R_FILE)
    numpy2ri.activate()


class Solver(BaseSolver):
    name = "biglasso"

    install_cmd = 'conda'
    requirements = ['r-base', 'rpy2', 'r-biglasso']
    stop_strategy = 'iteration'
    support_sparse = False

    def set_objective(self, X, y, lmbd):
        self.X, self.y, self.lmbd = X, y, lmbd
        self.lmbd_max = np.max(np.abs(X.T @ y))
        self.biglasso = robjects.r['biglasso_imp']

    def run(self, n_iter):
        fit_dict = {"lambda_min": self.lmbd / self.lmbd_max, "n_iter": n_iter}
        biglasso_fit = self.biglasso(
            self.X, self.y, **fit_dict
        )
        results = dict(zip(biglasso_fit.names, list(biglasso_fit)))
        as_matrix = robjects.r['as']
        coefs = np.array(as_matrix(results["beta"], "matrix"))
        self.w = coefs[:, -1]

    def get_result(self):
        return self.w
