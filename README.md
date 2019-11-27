# DTU10MW_SOWFA
An ALMAdvanced implementation of the DTU 10MW turbine for SOWFA

Author: B M Doekemeijer and J W van Wingerden

Date: November 27th, 2019



We have two proven cases where the 10MW behaves as described in the literature:
- For 3 spatial refinements (dx = 1.25 m, eps = 2.5 m), with dt = 0.05 s, we have k-opt = 1.15 and forceScalar = 1.15.
- For 2 spatial refinements (dx = 2.50 m, eps = 5.0 m), with dt = 0.20 s, we have k-opt = 1.15 and forceScalar = 1.15.


The file 'CLWindcon_DTU10MW_tuning.pdf' is an excerpt from a report from the European CL-Windcon project (Deliverable 3.5). This document briefly addresses how the DTU 10MW turbine was implemented and tuned in SOWFA.