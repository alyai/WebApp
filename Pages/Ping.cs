using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace WebApp.Pages
{
    public class IndexModel2 : PageModel
    {
        private readonly ILogger<IndexModel2> _logger;

        public IndexModel2(ILogger<IndexModel2> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }
}
