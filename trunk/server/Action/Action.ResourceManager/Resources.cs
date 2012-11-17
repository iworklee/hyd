using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Reflection;
using System.IO;

namespace Action.ResourceManager
{
    public class Resources
    {
        const string CONFIG_NAME = "ResPath";
        const string DEFAULT_DIR = "res";
        private string _resPath;
        
        public Resources()
        {
            string relatePath = ConfigurationManager.AppSettings[CONFIG_NAME];
            if (string.IsNullOrWhiteSpace(relatePath))
                relatePath = DEFAULT_DIR;

            _resPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, relatePath);
        }

    }
}
