{ config, lib, pkgs, ... }:

{
  home.file.".config/rofi/config.rasi".text = 
   ''
   configuration {
     display-drun: "Search: ";
     drun-display-format: "{name}";
     font: "Inter Regular 10";
   }
   
   @theme "/dev/null"
   
   * {
     border: 0;
     margin: 0;
     padding: 0;
     spacing: 0;
   }
   
   window {
     width: 30%;
     background-color: #11111b;
     border: 2;
     border-radius: 12px;
     border-color: #89b4fa;
   }
   
   element {
     padding: 8 12;
     background-color: transparent;
     text-color: #cdd6f4;
   }
   
   element selected {
     text-color: #11111b;
     background-color: #89b4fa;
   }
   
   element-text {
     background-color: transparent;
     text-color: inherit;
     vertical-align: 0.5;
   }
   
   element-icon {
     size: 20;
     padding: 0 10 0 0;
     background-color: transparent;
   }
   
   entry {
     padding: 12;
     background-color: #1e1e2e;
     text-color: #cdd6f4;
   }
   
   inputbar {
     children: [prompt, entry];
     background-color: #11111b;
   }
   
   listview {
     background-color: #11111b;
     columns: 1;
     lines: 10;
   }
   
   mainbox {
     children: [inputbar, listview];
     background-color: #11111b;
   }
   
   prompt {
     enabled: true;
     padding: 12 0 0 12;
     background-color: #1e1e2e;
     text-color: #cdd6f4;
   }
   '' ;
}

