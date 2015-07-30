package io.github.movax10.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
public class AdminController
{
   @RequestMapping("/control")
   public String control()
   {
      return "balance/control";
   }

   @RequestMapping("/replenishment")
   public String replenishment()
   {
      return "balance/replenishment";
   }

   @RequestMapping("/replenishmentHistory")
   public String replenishmentHistory()
   {
      return "balance/replenishmentHistory";
   }
}
