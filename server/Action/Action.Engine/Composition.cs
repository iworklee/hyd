﻿using System.ComponentModel.Composition;
using System.ComponentModel.Composition.Hosting;
using System.Diagnostics;
using SuperSocket.Common;
using System;

namespace Action.Engine
{
    public static class Composition
    {
        private static CompositionContainer _container;

        static Composition()
        {
            //Create the CompositionContainer with the parts in the catalog
            var path = AppDomain.CurrentDomain.RelativeSearchPath ?? AppDomain.CurrentDomain.BaseDirectory;
            var dirCatalog = new DirectoryCatalog(path, "Action.*.dll");
            _container = new CompositionContainer(dirCatalog);
        }

        private static object _syncRoot = new object();

        public static bool ComposeParts(params object[] attributedParts)
        {
            lock (_syncRoot)
            {
                try
                {
                    _container.ComposeParts(attributedParts);
                    return true;
                }
                catch (CompositionException compositionException)
                {
                    LogUtil.LogError(compositionException);
                    return false;
                }
            }
        }
    }
}
