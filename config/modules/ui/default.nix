{
  colorschemes.ayu.enable = true;

  plugins.lualine = {
    enable = true;
    settings = {
      extensions = [ "quickfix" ];
      options = {
        theme = "auto";
        globalstatus = true;
        component_separators = {
          left = "";
          right = "";
        };

        section_separators = {
          left = "";
          right = "";
        };

        icons_enabled = true;
      };

      sections = {
        lualine_a = [
          {
            __unkeyed-1 = "mode";
            icon = {
              __unkeyed-1 = " ";
              color = {
                fg = "008A3D";
              };
            };
          }
        ];
        lualine_b = [
          {
            __unkeyed-1 = "branch";
            icon = "";
          }
          "db_ui#statusline"
        ];
        lualine_c = [
          {
            __unkeyed-1 = "filename";
            file_status = true;
            path = 1;
          }
        ];

        lualine_x = [
          "diagnostics"
          "diff"
          {
            __unkeyed-1 = "require('laravel').app('status'):get('php')";
            icon = {
              __unkeyed-1 = " ";
              color.fg = "5e79be";
            };
          }
          {
            __unkeyed-1 = "require('laravel').app('status'):get('laravel')";
            icon = {
              __unkeyed-1 = " ";
              color.fg = "f9322c";
            };
          }
        ];

        lualine_y = [ "filetype" ];
        lualine_z = [ "location" ];
      };
    };
  };
}
