#
# DSTA 9-b: NMF in Scikit-learn
#
# 
import numpy as np

from sklearn.decomposition import NMF

# constant assigned to the dimension to be introduced by factorization.
K = 2


def main():

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


	ratings = np.array(ratings)

	# initialization of the Scikit machine
	model = NMF(n_components=K, init='random', random_state=0)

	W = model.fit_transform(ratings)

	# continuation of the previous call
	H = model.components_

	print(W)

	print(H)

    # let's visualise the error incurred.
	print(np.dot(W, H))

    # rounding of the result
	print(np.rint(np.dot(W, H)))


main()