{inputs, ...}: {
  hjem = {
    extraModules = [
      inputs.hjem-rum.hjemModules.default
    ];
    clobberByDefault = true;
  };
}
