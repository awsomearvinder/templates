{
  description = "My templates";

  outputs = { self, }: {
    templates = {
      rust-basic = {
        path = ./rust-basic;
        description = "basic rust template";
      };
    };
  };
}
