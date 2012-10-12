using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine.Command;

namespace Action.Login
{
    public class BackdoorLoginCommand : BaseCommand<int>
    {
        public override int Code
        {
            get { throw new NotImplementedException(); }
        }

        protected override void OnExecute(int data)
        {
            throw new NotImplementedException();
        }
    }
}
