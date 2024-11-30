{
  description = "loser flake templates";

  outputs = inputs: {
    templates = {
      test = {
        path = ./templates/test;
        description = "A test template";
      };

      bun = {
        path = ./templates/bun;
        description = "A bun template";
      };
    };
  };
}
