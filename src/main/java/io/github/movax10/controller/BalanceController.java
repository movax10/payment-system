package io.github.movax10.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BalanceController {

   @RequestMapping("/showBalance")
   public String show()
   {
      return "balance/show";
   }
}
