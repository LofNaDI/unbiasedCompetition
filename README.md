This is the [DynaSim](https://github.com/DynaSim/DynaSim) code implementation of the model described in **"Ardid, Sherfey, McCarthy, Hass, Pittman-Polletta, & Kopell (2019). Biased competition in the absence of input bias revealed through corticostriatal computation", published in *Proceedings of the National Academy of Sciences, USA***.

We conceptualize **Unbiased Competition** as *biased competition in the absence of input bias*, in contraposition to the traditional **Biased Competition** conception, which refers to *biased competition due to an input bias*.  

The code is free but copyrighted by Salva Ardid, and distributed under the terms of the GNU General Public Licence as published by the Free Software Foundation (version 3). Please ensure that any publication using this code is properly citing the original manuscript and links to this repository:

> Ardid, S., Sherfey, J. S., McCarthy, M. M., Hass, J., Pittman-Polletta, B. R., & Kopell, N. (2019). **Biased competition in the absence of input bias revealed through corticostriatal computation.** Proceedings of *the National Academy of Sciences*, 116(17), 8564-8569.
> 
> Code repository: https://github.com/LofNaDI/Unbiased_Competition

  
The code contains the following type of files:

1. **spn_network.m** file: This is the main script.
2. **.mech** files: These files contain DynaSim mechanisms. For more information about how to develop or implement mechanisms using Dynasim, please check [Dynasim's wiki](https://github.com/DynaSim/DynaSim/wiki).
3. Other **.m** files: These m-script functions are used for implementing the specifics of Poisson inputs in the model as well as computing and plotting rastergrams of neurons' activity. 
