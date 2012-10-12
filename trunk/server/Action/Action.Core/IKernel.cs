using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Core
{
    public interface IKernel
    {
        void Response(object data);
        void Save();
    }
}
