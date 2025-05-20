% Código ProbLog (salve como diagnostico.pl)

% Variáveis independentes (distribuição a priori)
0.33::str(dry).
0.33::str(wet).
0.34::str(snow_covered).

0.7::fhv(t).   % Flywheel mais provável estar bom
0.3::fhv(f).   % Flywheel desgastado

0.8::b(t).     % Lâmpada ok
0.2::b(f).

0.8::k(t).     % Cabo ok
0.2::k(f).

% Dinamo deslizante (R) depende de Str e Fhv
r(t) :- str(Str), fhv(Fhv), r_cond(Str, Fhv, t).
r(f) :- str(Str), fhv(Fhv), r_cond(Str, Fhv, f).

% CPT para R (valores hipotéticos)
0.9::r_cond(dry, t, t).     % Str dry, Fhv bom → alta probabilidade de R
0.1::r_cond(dry, t, f).
0.3::r_cond(dry, f, t).     % Fhv desgastado reduz probabilidade
0.7::r_cond(dry, f, f).

0.8::r_cond(wet, t, t).
0.2::r_cond(wet, t, f).
0.2::r_cond(wet, f, t).
0.8::r_cond(wet, f, f).

0.5::r_cond(snow_covered, t, t).  % Neve dificulta deslizamento
0.5::r_cond(snow_covered, t, f).
0.1::r_cond(snow_covered, f, t).
0.9::r_cond(snow_covered, f, f).

% Tensão (V) depende de R
0.95::v(t) :- r(t).  % R bom → alta probabilidade de V
0.05::v(f) :- r(t).
0.10::v(t) :- r(f).   % R ruim → baixa probabilidade
0.90::v(f) :- r(f).

% Consulta: P(V = t | Str = snow_covered)
query(v(t)) :- str(snow_covered).