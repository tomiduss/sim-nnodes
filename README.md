# sim-nnodes

Para iniciar la simulación, se debe correr
  rake sim:start

El intevalo de la simulacion (por defecto 3 minutos) se puede modificar a traves de la consola con:
  Casino.instance.update(interval: <intevalo nuevo>)
Este valor está en segundos.
