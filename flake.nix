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
      cs468 = {
        path = ./templates/school/cs468;
        description = "A cs468 template";
      };
      cs580 = {
        path = ./templates/school/cs580;
        description = "A cs580 template";
      };
    };
  };
}
