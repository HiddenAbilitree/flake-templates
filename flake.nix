{
  description = "loser flake templates";

  outputs = inputs: {
    templates = {
      bun = {
        path = ./templates/bun;
        description = "A bun template";
      };
      rust = {
        path = ./templates/rust;
        description = "A rust template";
      };
    };
  };
}
