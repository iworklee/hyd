using System.ComponentModel.Composition;
using System.ComponentModel.Composition.Hosting;
using System.Diagnostics;

namespace Action.Engine
{
    public static class Composition
    {
        private static CompositionContainer _container;

        static Composition()
        {
            //Create the CompositionContainer with the parts in the catalog
            var dirCatalog = new DirectoryCatalog(".", "Action.*.dll");
            _container = new CompositionContainer(dirCatalog);
        }

        private static object _syncRoot = new object();

        public static void ComposeParts(params object[] attributedParts)
        {
            lock (_syncRoot)
            {
                try
                {
                    _container.ComposeParts(attributedParts);
                }
                catch (CompositionException compositionException)
                {
                    Debug.WriteLine(compositionException.ToString());
                    throw;                    
                }
            }
        }
    }
}
