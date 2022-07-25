function xAp = newtonraphson(f,df,x0,tolerancia,N)
  f0=f(x0);
  df0=df(x0);
  if(abs(df0)<tolerancia)
    error('Derivada es casi cero');
  else
    x1=x0 - f0/df0;
  endif
  it = 1;
  while((abs(x1-x0)>tolerancia) && (it<N))
    x0=x1;
    f0=f(x0);
    df0=df(x0);
    if(abs(df0)<tolerancia)
      error('Derivada es casi cero');
    else
      x1=x0 - f0/df0;
      it++;
    endif
  endwhile
  if(it<=N)
    display('Aproximacion calculada')
    xAp=x1;
  else
    display('No se pudo calcular la aproximacion')
  endif
endfunction