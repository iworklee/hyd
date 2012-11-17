using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Reflection;
using System.IO;
using System.Xml.Linq;
using System.ComponentModel.Composition;

namespace Action.ResourceManager
{
    public class Resources
    {
        const string CONFIG_NAME = "ResPath";
        const string DEFAULT_DIR = "res";
        private string _resPath;

        private static readonly Lazy<Resources> instance = new Lazy<Resources>(() => new Resources());
        public static Resources Instance
        {
            get
            {
                return instance.Value;
            }
        }

        private Resources()
        {
            string relatePath = ConfigurationManager.AppSettings[CONFIG_NAME];
            if (string.IsNullOrWhiteSpace(relatePath))
                relatePath = DEFAULT_DIR;

            _resPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, relatePath);

            LoadUnitType();
            LoadSkills();
        }

        private void LoadSkills()
        {
        }

        private Dictionary<int, XElement> _unitType;
        public Dictionary<int, XElement> UnitType { get { return _unitType; } }
        private void LoadUnitType()
        {
            var xmlFile = XElement.Load(Path.Combine(_resPath, "UnitType.xml"));
            _unitType = xmlFile.Elements().ToDictionary(x => (int)x.Element("ID"));
        }

    }
}
