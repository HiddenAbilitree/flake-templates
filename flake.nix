{
  description = "loser flake templates";

  outputs = {
    templates = {
      bun = {
        path = ./templates/bun;
        description = "A bun template";
      };
    };
  };
}
