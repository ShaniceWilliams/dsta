# type: ignore
# flake8: noqa
def find_eigenpairs(mat):
	"""Test the quality of Numpy eigenpairs"""
	n = len(mat)

	# is it sqaured?
	m = len(mat[0])


	eig_vals, eig_vects = la.eig(mat)

	# they come in ascending order, take the last one on the right
	dominant_eig = abs(eig_vals[-1])
	return dominant_eig


