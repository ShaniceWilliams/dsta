'''

DSTA: Running example from Ch 11 of "Mining Massive Datasets"

Bonus code:
--NMF example
--testing singularity of Colley's matrices.

'''


import numpy as np

from sklearn.decomposition import NMF

# constant assigned to the dimension to be introduced by factorization.
K = 2

viewers = ['Joe', 'Jim', 'John', 'Jack', 'Jill', 'Jenny', 'Jane']

films = ['Matrix', 'Alien', 'Star Wars', 'Casablanca', 'Titanic']

ratings =  [[1, 1, 1, 0, 0],
			[3, 3, 3, 0, 0],
			[4, 4, 4, 0, 0],
			[5, 5, 5, 0, 0],
			[0, 0, 0, 4, 4],
			[0, 0, 0, 5, 5],
			[0, 0, 0, 2, 2]]



ratings2 =  [[1, 1, 1, 0, 0],
			 [3, 3, 3, 0, 0],
			 [4, 4, 4, 0, 0],
			 [5, 5, 5, 0, 0],
			 [0, 2, 0, 4, 4],
			 [0, 0, 0, 5, 5],
			 [0, 1, 0, 2, 2]]


# ----------------- SVD ---------------------------------------

ratings2 = np.array(ratings2)

print('data matrix ha shape ', ratings2.shape)

#split the matrix in the three components
u, s, vh = np.linalg.svd(ratings2, full_matrices=False)


print('U has shape ', u.shape, s.shape, vh.shape)

sigma = np.diag(s)
print('Sigma has shape ', sigma.shape)

print(sigma)
print('V^t has shape ', vh.shape)

sigmavh = np.dot(sigma, vh)

#  A = U*Sigma*V^t

usigmavh = np.dot(u, sigmavh)

print(usigmavh)

# verify that the recombination is currect up to roundings
print(np.allclose(ratings2, usigmavh))

			