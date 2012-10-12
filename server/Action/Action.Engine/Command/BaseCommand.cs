using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Core;

namespace Action.Engine.Command
{
    public abstract class BaseCommand<T> : ICommand
    {
        protected IKernel _kernel;

        public abstract int Code { get; }

        public string Name
        {
            get { return GetType().FullName; }
        }

        public virtual bool Validate()
        {
            return true;
        }

        public void Initialize(IKernel knl)
        {
            _kernel = knl;
        }

        public void Execute(object data)
        {
            OnExecute((T)data);
        }

        protected abstract void OnExecute(T data);
    }
}
