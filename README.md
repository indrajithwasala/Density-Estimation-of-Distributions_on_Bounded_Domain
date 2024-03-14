# Density_Estimation_of_Distributions_on_Bounded_Domain

In parametric density estimation methods, we assume knowledge of the distribution's shape, but lack specific parameters. These parameters are estimated using methods like maximum likelihood estimation, chosen either through pre-modeling or model selection criteria. However, if the distribution has an unknown truncation, parameter estimations may be inaccurate. Additionally, existing parametric methods often pose computational challenges with large datasets.

In this thesis, I propose a new parametric density estimation method for distributions with unknown truncation. I introduce two density estimation approaches based on estimating the derivative of the empirical distribution. These approaches enhance efficiency by eliminating the need for model selection procedures and potentially simplifying algorithm complexity.

The first method involves estimating densities using a polynomial approximation of the empirical distribution function. The second method, a mode-based density identification, employs a four-parameter family of functions. The principal assumption is that the mode falls within the data range. I demonstrate the application of these methods using ecological datasets, where data ranges are often restricted by geographical or ecological constraints.
