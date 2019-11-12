from scipy.stats import rice
import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(rice.ppf(0.01, b),rice.ppf(0.99, b), 100)
ax.plot(x, rice.pdf(x, b),'r-', lw=5, alpha=0.6, label='rice pdf')
plt.show()
